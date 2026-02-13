import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/themeProvider.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Services/PromotionService/promotionService.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Services/PaystackService/paystackService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/vehicleService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:logger/Logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class WebViewPaymentPage extends StatefulWidget {
  final Map<String, dynamic> allJson;

  const WebViewPaymentPage({super.key, required this.allJson});

  @override
  State<WebViewPaymentPage> createState() => _WebViewPaymentPageState();
}

class _WebViewPaymentPageState extends State<WebViewPaymentPage> {
  final Logger _logger = Logger();
  late WebViewController _webViewController;
  bool _isLoading = true;
  final bool _paymentVerified = false;
  bool _paymentFailed = false;
  bool _isProcessing = false;
  bool _isUploading = false;
  bool _isPromoting = false;
  bool _showManualNavigationButton = false;
  bool _uploadComplete = false;
  bool _promotionComplete = false;
  String _errorMessage = '';
  String _detailedError = '';
  String _currentStatus = 'Initializing payment...';

  // Payment data from arguments
  late String _authorizationUrl;
  late String _reference;
  late int _amount;
  late String _packageName;
  late String _listingName;
  late String _listingId;
  late String _packageId;
  late int _durationDays;
  late String _type;

  // Timer for auto-verification
  Timer? _verificationTimer;
  Timer? _redirectCheckTimer;
  Timer? _manualButtonTimer;
  Timer? _statusUpdateTimer;

  @override
  void initState() {
    super.initState();
    try {
      _initializeFromArguments();
      _initializeWebView();
      _startAutoVerificationTimer();
      _startStatusUpdates();
    } catch (e, stackTrace) {
      _handleCriticalError('Initialization failed: ${e.toString()}', stackTrace.toString());
    }
  }

  void _startStatusUpdates() {
    _statusUpdateTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!_paymentVerified && !_paymentFailed && mounted) {
        if (_isProcessing && !_isUploading && !_isPromoting) {
          _updateStatus('Verifying payment with bank...');
        }
      } else {
        timer.cancel();
      }
    });
  }

  void _updateStatus(String status) {
    if (mounted) {
      setState(() {
        _currentStatus = status;
      });
    }
  }

  void _startAutoVerificationTimer() {
    _verificationTimer = Timer(const Duration(seconds: 90), () {
      if (!_paymentVerified && !_isProcessing && mounted) {
        _updateStatus('Auto-verifying payment...');
        _verifyPayment();
      }
    });

    _redirectCheckTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (!_paymentVerified && !_isProcessing && mounted) {
        _checkCurrentUrl();
      } else {
        timer.cancel();
      }
    });

    _manualButtonTimer = Timer(const Duration(seconds: 30), () {
      if (!_paymentVerified && !_paymentFailed && mounted) {
        setState(() {
          _showManualNavigationButton = true;
        });
      }
    });
  }

  Future<void> _checkCurrentUrl() async {
    try {
      final currentUrl = await _webViewController.currentUrl();
      if (currentUrl != null && mounted) {
        _checkPaymentSuccess(currentUrl);
      }
    } catch (e) {
      // Silent fail
    }
  }

  void _initializeFromArguments() {
    try {
      final arguments = Get.arguments as Map<String, dynamic>?;
      
      if (arguments == null) {
        throw Exception('No arguments provided to WebViewPaymentPage');
      }
      
      _authorizationUrl = arguments['authorizationUrl']?.toString() ?? '';
      _reference = arguments['reference']?.toString() ?? '';
      _amount = (arguments['amount'] as int?) ?? 0;
      _packageName = arguments['packageName']?.toString() ?? 'Unknown Package';
      _listingName = arguments['listingName']?.toString() ?? 'Unknown Listing';
      _listingId = arguments['listingId']?.toString() ?? 'unknown';
      _packageId = arguments['packageId']?.toString() ?? '';
      _durationDays = (arguments['durationDays'] as int?) ?? 7;
      _type = arguments['type']?.toString() ?? 'upload';

      _logger.i('🔍 PAYMENT INITIALIZATION:');
      _logger.i('   - Type: $_type');
      _logger.i('   - Package: $_packageName');
      _logger.i('   - Reference: $_reference');

      if (_authorizationUrl.isEmpty) {
        throw Exception('Authorization URL is empty or missing');
      }
      
      if (_reference.isEmpty) {
        throw Exception('Payment reference is empty or missing');
      }

    } catch (e, stackTrace) {
      _handleCriticalError('Failed to initialize payment data: ${e.toString()}', stackTrace.toString());
      rethrow;
    }
  }

  void _initializeWebView() {
    try {
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              if (mounted) {
                setState(() {
                  _currentStatus = 'Loading payment page... ($progress%)';
                });
              }
            },
            onPageStarted: (String url) {
              if (mounted) {
                setState(() {
                  _isLoading = true;
                  _currentStatus = 'Loading secure payment page...';
                });
              }
              _checkPaymentSuccess(url);
            },
            onPageFinished: (String url) {
              if (mounted) {
                setState(() {
                  _isLoading = false;
                  _currentStatus = 'Payment page loaded';
                });
              }
              _checkPaymentSuccess(url);
            },
            onWebResourceError: (WebResourceError error) {
              if (mounted) {
                setState(() {
                  _isLoading = false;
                  _paymentFailed = true;
                  _errorMessage = 'Payment page failed to load';
                  _detailedError = 'WebView Error: ${error.errorCode} - ${error.description}';
                  _currentStatus = 'Payment page failed to load';
                });
              }
            },
            onNavigationRequest: (NavigationRequest request) {
              _checkPaymentSuccess(request.url);
              return NavigationDecision.navigate;
            },
            onUrlChange: (UrlChange change) {
              if (change.url != null) {
                _checkPaymentSuccess(change.url!);
              }
            },
          ),
        )
        ..loadRequest(Uri.parse(_authorizationUrl));

    } catch (e, stackTrace) {
      _handleCriticalError('Failed to initialize WebView: ${e.toString()}', stackTrace.toString());
    }
  }

  void _checkPaymentSuccess(String url) {
    try {
      if (_paymentVerified || _isProcessing) {
        return;
      }

      final successPatterns = [
        'success', 'transaction', 'trxref=', 'reference=', 'status=success',
        'verified', 'approved', 'completed', 'thank', 'gag-cars', 'return', 
        'redirect', 'callback', 'paystack.com/success', 'paystack.co/success',
        'charge.success', 'transaction/success', 'payment/verify', 'callback',
      ];
      
      final excludePatterns = [
        'checkout.paystack.com/viff3zgs61lrnka',
        '/charge/authorize', '/pay/authorize', 'checkout.paystack.com/#',
        'checkout.paystack.com/pay', 'processing', 'pending', 'waiting'
      ];
      
      final hasSuccessIndicator = successPatterns.any((pattern) => 
          url.toLowerCase().contains(pattern.toLowerCase()));
      final isExcludedPage = excludePatterns.any((pattern) => 
          url.toLowerCase().contains(pattern.toLowerCase()));

      final shouldVerify = (hasSuccessIndicator && !isExcludedPage) || 
                          (!url.contains('checkout.paystack.com') && 
                           !url.contains('viff3zgs61lrnka') && 
                           url.isNotEmpty);

      if (shouldVerify && !_paymentVerified && !_isProcessing) {
        _updateStatus('Payment detected - verifying...');
        _verifyPayment();
      }
    } catch (e) {
      // Silent fail
    }
  }

  Future<void> _verifyPayment() async {
    if (_paymentVerified) {
      return;
    }
    
    if (_isProcessing) {
      return;
    }

    if (mounted) {
      setState(() {
        _isProcessing = true;
        _isLoading = true;
        _currentStatus = 'Starting payment verification...';
      });
    }

    try {
      _updateStatus('Contacting payment gateway...');
      
      final result = await LegacyPaystackService.verifyTransaction(
        reference: _reference,
      ).timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException('Payment verification timed out after 30 seconds');
      });

      if (result['status'] == true) {
        _updateStatus('Payment verified successfully!');
        
        try {
          await _storePaymentSuccess();
          
          if (_type == 'upload') {
            await _uploadVehicleAndNavigate();
          } else if (_type == 'promotion') {
            await _activatePromotionAndNavigate();
          } else {
            throw Exception('Unknown payment type: $_type');
          }
          
        } catch (storageError) {
          _navigateToPaymentFailedPage(
            errorMessage: 'Payment successful but failed to process: $storageError',
            transactionReference: _reference,
          );
        }
        
      } else {
        _navigateToPaymentFailedPage(
          errorMessage: result['message']?.toString() ?? 'Payment verification failed',
          transactionReference: _reference,
        );
      }
    } on TimeoutException {
      _navigateToPaymentFailedPage(
        errorMessage: 'Payment verification timed out',
        transactionReference: _reference,
      );
    } catch (e) {
      _navigateToPaymentFailedPage(
        errorMessage: 'Failed to verify payment: ${e.toString()}',
        transactionReference: _reference,
      );
    }
  }

  // ========== PROMOTION FLOW METHODS ==========

  Future<void> _debugPromotionData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedDataString = prefs.getString('pending_promotion_data');
      
      if (storedDataString != null) {
        _logger.i('🔍 PROMOTION DATA DEBUG:');
        _logger.i('   - Raw JSON: $storedDataString');
        
        final promotionData = json.decode(storedDataString);
        _logger.i('   - Decoded Data Type: ${promotionData.runtimeType}');
        _logger.i('   - All Keys: ${promotionData.keys.toList()}');
        
        // Check critical fields
        _logger.i('   - item_id: ${promotionData['item_id']} (type: ${promotionData['item_id']?.runtimeType})');
        _logger.i('   - listing_name: ${promotionData['listing_name']}');
        _logger.i('   - listing_id: ${promotionData['listing_id']}');
      } else {
        _logger.e('❌ No stored promotion data found');
      }
    } catch (e, stackTrace) {
      _logger.e('❌ Error debugging promotion data: $e');
      _logger.e('❌ Stack trace: $stackTrace');
    }
  }

  Future<void> _validatePromotionData(Map<String, dynamic> promotionData) async {
    _logger.i('🔍 VALIDATING PROMOTION DATA...');
    
    final requiredFields = ['item_id', 'listing_id'];
    
    for (final field in requiredFields) {
      if (promotionData[field] == null || promotionData[field].toString().isEmpty) {
        throw Exception('Missing required field: $field');
      }
      _logger.i('   ✅ $field: ${promotionData[field]}');
    }
    
    // Validate item_id
    final itemId = promotionData['item_id'];
    if (itemId is String) {
      _logger.i('   ✅ item_id is valid string: $itemId');
    }
    
    // Validate listing_id
    final listingId = promotionData['listing_id'];
    if (listingId is String) {
      _logger.i('   ✅ listing_id is valid string: $listingId');
    }
    
    _logger.i('✅ PROMOTION DATA VALIDATION COMPLETED SUCCESSFULLY');
  }

  Future<Map<String, dynamic>> _loadPromotionDataFromStorage() async {
    try {
      _updateStatus('Loading promotion data...');
      
      final prefs = await SharedPreferences.getInstance();
      final storedDataString = prefs.getString('pending_promotion_data');
      
      if (storedDataString == null || storedDataString.isEmpty) {
        throw Exception('No promotion data found in storage');
      }
      
      final promotionData = json.decode(storedDataString);
      
      _logger.i('🎯 PROMOTION DATA LOADED FROM STORAGE:');
      _logger.i('   - Item ID: ${promotionData['item_id']}');
      _logger.i('   - Listing Name: ${promotionData['listing_name']}');
      _logger.i('   - Listing ID: ${promotionData['listing_id']}');
      
      // Run debug to see exact data structure
      await _debugPromotionData();
      
      _updateStatus('Promotion data loaded successfully');
      
      return promotionData;
    } catch (e, stackTrace) {
      _logger.e('❌ ERROR loading promotion data: $e');
      _logger.e('❌ Stack trace: $stackTrace');
      _updateStatus('Error loading promotion data');
      rethrow;
    }
  }

  Future<void> _clearPromotionDataFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('pending_promotion_data');
      await prefs.remove('pending_promotion');
      _logger.i('✅ Promotion data cleared from storage after successful activation');
    } catch (e) {
      _logger.e('❌ ERROR clearing promotion data: $e');
      // Don't rethrow - we don't want to fail the whole process due to cleanup error
    }
  }

  Future<void> _activatePromotionAndNavigate() async {
    if (mounted) {
      setState(() {
        _isPromoting = true;
        _currentStatus = 'Preparing to activate promotion...';
      });
    }

    try {
      // ✅ STEP 1: Load complete promotion data from SharedPreferences
      _updateStatus('Loading promotion data...');
      final completePromotionData = await _loadPromotionDataFromStorage();
      
      _logger.i('🎯 PROMOTION DATA FOR ACTIVATION:');
      _logger.i('   - Item ID: ${completePromotionData['item_id']}');
      _logger.i('   - Listing Name: ${completePromotionData['listing_name']}');
      _logger.i('   - Listing ID: ${completePromotionData['listing_id']}');
      _logger.i('   - All keys: ${completePromotionData.keys.toList()}');

      // ✅ STEP 2: Validate data structure
      _updateStatus('Validating promotion data...');
      await _validatePromotionData(completePromotionData);

      // ✅ STEP 3: Calculate promotion dates based on package duration
      _updateStatus('Setting up promotion period...');
      final dates = PromotionService.calculatePromotionDates(_durationDays);
      
      _logger.i('📅 PROMOTION DATES:');
      _logger.i('   - Start: ${dates['start_at']}');
      _logger.i('   - End: ${dates['end_at']}');
      _logger.i('   - Duration: $_durationDays days');

      // ✅ STEP 4: Activate promotion using the service
      _updateStatus('Activating promotion...');
      _logger.i('🚀 ACTIVATING PROMOTION...');
      
      final result = await PromotionService.activatePromotion(
        itemId: completePromotionData['item_id'],
        startAt: dates['start_at']!,
        endAt: dates['end_at']!,
        status: 'active',
      );

      if (result['success'] == true) {
        _logger.i('✅ PROMOTION ACTIVATED SUCCESSFULLY');
        _updateStatus('Promotion activated successfully!');
        
        // ✅ STEP 5: Wait for backend to process the promotion
        _updateStatus('Processing your promotion...');
        await Future.delayed(const Duration(seconds: 2));
        
        // ✅ STEP 6: Clear stored data only after successful activation
        _updateStatus('Finalizing promotion...');
        await _clearPromotionDataFromStorage();
        
        // ✅ STEP 7: Mark promotion as complete
        if (mounted) {
          setState(() {
            _promotionComplete = true;
          });
        }
        
        // ✅ STEP 8: Wait a moment to show completion state
        _updateStatus('Promotion completed successfully!');
        await Future.delayed(const Duration(seconds: 1));
        
        // ✅ STEP 9: Navigate to success page
        await _navigateToPaymentSuccessPage();
        
      } else {
        throw Exception('Failed to activate promotion: ${result['message']}');
      }
      
    } catch (e, stackTrace) {
      _logger.e('❌ PROMOTION ACTIVATION FAILED: $e');
      _logger.e('❌ STACK TRACE: $stackTrace');
      _updateStatus('Promotion activation failed - navigating with error...');
      await _navigateToPaymentSuccessPage(promotionError: 'Promotion activation failed: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isPromoting = false;
        });
      }
    }
  }

  // ========== VEHICLE UPLOAD FLOW METHODS (Keep existing) ==========

  Future<void> _debugStoredData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedDataString = prefs.getString('pending_vehicle_data');
      
      if (storedDataString != null) {
        _logger.i('🔍 STORED DATA DEBUG:');
        _logger.i('   - Raw JSON: $storedDataString');
        
        final vehicleData = json.decode(storedDataString);
        _logger.i('   - Decoded Data Type: ${vehicleData.runtimeType}');
        _logger.i('   - All Keys: ${vehicleData.keys.toList()}');
        
        // Check critical fields
        _logger.i('   - brand_id: ${vehicleData['brand_id']} (type: ${vehicleData['brand_id']?.runtimeType})');
        _logger.i('   - brand_model_id: ${vehicleData['brand_model_id']} (type: ${vehicleData['brand_model_id']?.runtimeType})');
        _logger.i('   - category_id: ${vehicleData['category_id']} (type: ${vehicleData['category_id']?.runtimeType})');
        _logger.i('   - name: ${vehicleData['name']}');
        _logger.i('   - price: ${vehicleData['price']}');
        _logger.i('   - location: ${vehicleData['location']}');
        
        // Check images
        final images = vehicleData['images'];
        _logger.i('   - Images: $images (type: ${images.runtimeType})');
        if (images is List) {
          _logger.i('   - Images count: ${images.length}');
          for (int i = 0; i < images.length; i++) {
            final imagePath = images[i].toString();
            final fileExists = await File(imagePath).exists();
            _logger.i('     - Image $i: $imagePath (exists: $fileExists)');
          }
        }
      } else {
        _logger.e('❌ No stored vehicle data found');
      }
    } catch (e, stackTrace) {
      _logger.e('❌ Error debugging stored data: $e');
      _logger.e('❌ Stack trace: $stackTrace');
    }
  }

  Future<void> _validateVehicleData(Map<String, dynamic> vehicleData) async {
    _logger.i('🔍 VALIDATING VEHICLE DATA...');
    
    final requiredFields = ['category_id', 'brand_id', 'brand_model_id', 'name', 'price', 'location'];
    
    for (final field in requiredFields) {
      if (vehicleData[field] == null || vehicleData[field].toString().isEmpty) {
        throw Exception('Missing required field: $field');
      }
      _logger.i('   ✅ $field: ${vehicleData[field]}');
    }
    
    // Validate and fix brand_id structure
    final brandId = vehicleData['brand_id'];
    if (brandId is Map) {
      _logger.i('   🔧 Converting brand_id from Map to ID');
      vehicleData['brand_id'] = brandId['id'];
    } else if (brandId is String) {
      final parsed = int.tryParse(brandId);
      if (parsed != null) {
        _logger.i('   🔧 Converting brand_id from String to int');
        vehicleData['brand_id'] = parsed;
      }
    }
    
    // Validate brand_model_id
    final brandModelId = vehicleData['brand_model_id'];
    if (brandModelId is String) {
      final parsed = int.tryParse(brandModelId);
      if (parsed != null) {
        _logger.i('   🔧 Converting brand_model_id from String to int');
        vehicleData['brand_model_id'] = parsed;
      }
    }
    
    // Validate category_id
    final categoryId = vehicleData['category_id'];
    if (categoryId is String) {
      final parsed = int.tryParse(categoryId);
      if (parsed != null) {
        _logger.i('   🔧 Converting category_id from String to int');
        vehicleData['category_id'] = parsed;
      }
    }
    
    // Validate images
    final images = vehicleData['images'];
    if (images is! List || images.isEmpty) {
      throw Exception('No valid images found in stored data');
    }
    
    _logger.i('   ✅ Images count: ${images.length}');
    
    // Check if image files exist and convert paths
    final validImageFiles = <File>[];
    for (var imagePath in images) {
      final filePath = imagePath.toString();
      final file = File(filePath);
      if (await file.exists()) {
        validImageFiles.add(file);
        _logger.i('   ✅ Image exists: $filePath');
      } else {
        _logger.e('   ❌ Image missing: $filePath');
        throw Exception('Image file not found: $filePath');
      }
    }
    
    if (validImageFiles.length < 4) {
      throw Exception('At least 4 valid images are required. Found: ${validImageFiles.length}');
    }
    
    // Update vehicle data with validated images
    vehicleData['images'] = validImageFiles;
    
    _logger.i('✅ VEHICLE DATA VALIDATION COMPLETED SUCCESSFULLY');
  }

  Future<Map<String, dynamic>> _loadVehicleDataFromStorage() async {
    try {
      _updateStatus('Loading vehicle data...');
      
      final prefs = await SharedPreferences.getInstance();
      final storedDataString = prefs.getString('pending_vehicle_data');
      
      if (storedDataString == null || storedDataString.isEmpty) {
        throw Exception('No vehicle data found in storage');
      }
      
      final vehicleData = json.decode(storedDataString);
      
      _logger.i('🚗 VEHICLE DATA LOADED FROM STORAGE:');
      _logger.i('   - Vehicle name: ${vehicleData['name']}');
      _logger.i('   - Category ID: ${vehicleData['category_id']}');
      _logger.i('   - Brand ID: ${vehicleData['brand_id']}');
      _logger.i('   - Model ID: ${vehicleData['brand_model_id']}');
      _logger.i('   - Price: ${vehicleData['price']}');
      _logger.i('   - Location: ${vehicleData['location']}');
      _logger.i('   - Images count: ${vehicleData['images']?.length ?? 0}');
      
      // Run debug to see exact data structure
      await _debugStoredData();
      
      _updateStatus('Vehicle data loaded successfully');
      
      return vehicleData;
    } catch (e, stackTrace) {
      _logger.e('❌ ERROR loading vehicle data: $e');
      _logger.e('❌ Stack trace: $stackTrace');
      _updateStatus('Error loading vehicle data');
      rethrow;
    }
  }

  Future<void> _clearVehicleDataFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('pending_vehicle_data');
      await prefs.remove('pending_upload');
      _logger.i('✅ Vehicle data cleared from storage after successful upload');
    } catch (e) {
      _logger.e('❌ ERROR clearing vehicle data: $e');
      // Don't rethrow - we don't want to fail the whole process due to cleanup error
    }
  }

  String _createSlug(String name) {
    return '${name.toLowerCase().replaceAll(' ', '-')}-${DateTime.now().millisecondsSinceEpoch}';
  }

  Future<void> _uploadVehicleAndNavigate() async {
    if (mounted) {
      setState(() {
        _isUploading = true;
        _currentStatus = 'Preparing to upload vehicle...';
      });
    }

    try {
      // ✅ STEP 1: Load complete vehicle data from SharedPreferences
      _updateStatus('Loading vehicle data...');
      final completeVehicleData = await _loadVehicleDataFromStorage();
      
      _logger.i('🚗 VEHICLE DATA FOR UPLOAD:');
      _logger.i('   - Name: ${completeVehicleData['name']}');
      _logger.i('   - Category: ${completeVehicleData['category_id']}');
      _logger.i('   - Brand: ${completeVehicleData['brand_id']}');
      _logger.i('   - Model: ${completeVehicleData['brand_model_id']}');
      _logger.i('   - Price: ${completeVehicleData['price']}');
      _logger.i('   - Location: ${completeVehicleData['location']}');
      _logger.i('   - Images count: ${completeVehicleData['images']?.length ?? 0}');
      _logger.i('   - All keys: ${completeVehicleData.keys.toList()}');

      // ✅ STEP 2: Validate and fix data structure
      _updateStatus('Validating data...');
      await _validateVehicleData(completeVehicleData);

      // ✅ STEP 3: Process images (already done in validation)
      _updateStatus('Processing images...');
      final List<File> imageFiles = completeVehicleData['images'];

      // ✅ STEP 4: Prepare request body WITHOUT duplicates
      _updateStatus('Preparing upload data...');
      final requestBody = {
        'category_id': completeVehicleData['category_id'],
        'brand_id': completeVehicleData['brand_id'],
        'brand_model_id': completeVehicleData['brand_model_id'], 
        'name': completeVehicleData['name'],
        'slug': completeVehicleData['slug'] ?? _createSlug(completeVehicleData['name']),
        'location': completeVehicleData['location'],
        'price': completeVehicleData['price'],
        'description': completeVehicleData['description'] ?? '',
        'features': completeVehicleData['features'] ?? [],
        'images': imageFiles,
      };

      // Add additional fields (excluding duplicates)
      completeVehicleData.forEach((key, value) {
        if (!requestBody.containsKey(key) && 
            key != 'images' && 
            key != 'category_id' && 
            key != 'brand_id' && 
            key != 'brand_model_id' && 
            key != 'name' && 
            key != 'slug' && 
            key != 'location' && 
            key != 'price' && 
            key != 'description' && 
            key != 'features') {
          requestBody[key] = value;
        }
      });

      _logger.i('📤 FINAL UPLOAD REQUEST BODY:');
      _logger.i('   - Keys: ${requestBody.keys.toList()}');
      _logger.i('   - Images count: ${imageFiles.length}');
      _logger.i('   - Category ID: ${requestBody['category_id']} (type: ${requestBody['category_id']?.runtimeType})');
      _logger.i('   - Brand ID: ${requestBody['brand_id']} (type: ${requestBody['brand_id']?.runtimeType})');
      _logger.i('   - Model ID: ${requestBody['brand_model_id']} (type: ${requestBody['brand_model_id']?.runtimeType})');

      // ✅ STEP 5: Upload vehicle to server
      _updateStatus('Uploading vehicle to server...');
      _logger.i('📤 UPLOADING VEHICLE TO SERVER...');
      
      await VehicleService.uploadVehicle(requestBody: requestBody);
      _logger.i('✅ VEHICLE UPLOADED SUCCESSFULLY');
      _updateStatus('Vehicle uploaded successfully!');
      
      // ✅ STEP 6: Wait for backend to process the upload
      _updateStatus('Processing your vehicle listing...');
      await Future.delayed(const Duration(seconds: 2));
      
      // ✅ STEP 7: Clear stored data only after successful upload and processing
      _updateStatus('Finalizing upload...');
      await _clearVehicleDataFromStorage();
      
      // ✅ STEP 8: Mark upload as complete
      if (mounted) {
        setState(() {
          _uploadComplete = true;
        });
      }
      
      // ✅ STEP 9: Wait a moment to show completion state
      _updateStatus('Upload completed successfully!');
      await Future.delayed(const Duration(seconds: 1));
      
      // ✅ STEP 10: Navigate to success page
      await _navigateToPaymentSuccessPage();
      
    } catch (e, stackTrace) {
      _logger.e('❌ VEHICLE UPLOAD FAILED: $e');
      _logger.e('❌ STACK TRACE: $stackTrace');
      _updateStatus('Upload failed - navigating with error...');
      await _navigateToPaymentSuccessPage(uploadError: 'Vehicle upload failed: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  Future<void> _navigateToPaymentSuccessPage({String? uploadError, String? promotionError}) async {
    try {
      final successData = {
        'transactionReference': _reference,
        'amount': _amount,
        'packageName': _packageName,
        'listingName': _listingName,
        'type': _type,
        'uploadError': uploadError,
        'promotionError': promotionError,
        'uploadComplete': _uploadComplete,
        'promotionComplete': _promotionComplete,
      };

      _updateStatus('Navigation to success page...');
      
      Get.offAllNamed(
        RouteClass.getPaymentSuccessPage(),
        arguments: successData,
      );
      
    } catch (e, stackTrace) {
      try {
        _updateStatus('Navigation failed, using fallback...');
        Get.offAllNamed(RouteClass.getMainBottomNavigationPage());
      } catch (fallbackError) {
        _handleCriticalError(
          'Navigation failed: ${e.toString()}',
          stackTrace.toString()
        );
      }
    }
  }

  void _navigateToPaymentFailedPage({required String errorMessage, required String transactionReference}) {
    try {
      final failedData = {
        'errorMessage': errorMessage,
        'transactionReference': transactionReference,
        'packageName': _packageName,
        'amount': _amount,
      };

      Get.offAllNamed(
        RouteClass.getPaymentFailedPage(),
        arguments: failedData,
      );
    } catch (e) {
      Get.offAllNamed(RouteClass.getMainBottomNavigationPage());
    }
  }

  void _manualNavigateToSuccess() {
    showCustomSnackBar(
      backgroundColor: ColorGlobalVariables.brownColor,
      title: 'Processing',
      message: 'Checking payment status and proceeding...'
    );
    
    _verifyPayment();
  }

  Future<void> _storePaymentSuccess() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      final paymentData = {
        'reference': _reference,
        'amount': _amount,
        'packageName': _packageName,
        'packageId': _packageId,
        'listingName': _listingName,
        'listingId': _listingId,
        'durationDays': _durationDays,
        'type': _type,
        'timestamp': DateTime.now().toIso8601String(),
      };
      
      await prefs.setString('last_payment_data', json.encode(paymentData));
    } catch (e) {
      rethrow;
    }
  }

  void _handleCriticalError(String userMessage, String detailedError) {
    if (mounted) {
      setState(() {
        _paymentFailed = true;
        _isLoading = false;
        _errorMessage = userMessage;
        _detailedError = detailedError;
        _currentStatus = 'Critical error occurred';
      });
    }
  }

  Future<void> _manualVerifyPayment() async {
    if (_isProcessing) {
      return;
    }
    
    showCustomSnackBar(
      backgroundColor: ColorGlobalVariables.brownColor,
      title: 'Checking Payment',
      message: 'Verifying payment status...'
    );
    
    await _verifyPayment();
  }

  void _handlePaymentRetry() {
    if (mounted) {
      setState(() {
        _paymentFailed = false;
        _errorMessage = '';
        _detailedError = '';
        _isLoading = true;
        _currentStatus = 'Retrying payment...';
      });
    }
    
    _webViewController.reload();
  }

  void _handleCancelPayment() {
    Get.back();
  }

  @override
  void dispose() {
    _verificationTimer?.cancel();
    _redirectCheckTimer?.cancel();
    _manualButtonTimer?.cancel();
    _statusUpdateTimer?.cancel();
    super.dispose();
  }

  // ========== UI BUILDING METHODS ==========

  Widget _buildManualNavigationButton(bool isDarkMode) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF424242) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDarkMode ? 0.3 : 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: ColorGlobalVariables.brownColor),
        ),
        child: Column(
          children: [
            Icon(
              Icons.touch_app_rounded,
              color: ColorGlobalVariables.brownColor,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              'Payment Completed?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'If you have completed payment but are still on this page, tap below to proceed',
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.white60 : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _manualNavigateToSuccess,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorGlobalVariables.brownColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'PROCEED TO RECEIPT',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator(bool isDarkMode) {
    String statusText = _currentStatus;
    String subText = '';
    
    if (_isProcessing) {
      subText = 'Please wait while we process your payment...';
    } else if (_isUploading) {
      subText = 'Your vehicle is being uploaded to our servers...';
    } else if (_isPromoting) {
      subText = 'Your promotion is being activated...';
    } else if (_paymentVerified) {
      subText = 'Please wait while we complete your purchase...';
    } else {
      subText = 'Redirecting to secure payment page...';
    }

    return Container(
      color: isDarkMode ? const Color(0xFF303030) : Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: ColorGlobalVariables.brownColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
                      strokeWidth: 3,
                      backgroundColor: ColorGlobalVariables.brownColor.withValues(alpha: 0.2),
                    ),
                  ),
                  Icon(
                    _getStatusIcon(),
                    size: 32,
                    color: ColorGlobalVariables.brownColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Column(
                children: [
                  Text(
                    statusText,
                    style: TextStyle(
                      color: ColorGlobalVariables.brownColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subText,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.grey[600],
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            if (_isUploading || _isPromoting) ...[
              const SizedBox(height: 24),
              _buildProgressSteps(isDarkMode),
            ],
            
            if (!_paymentVerified && !_isProcessing && !_isUploading && !_isPromoting) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _manualVerifyPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorGlobalVariables.brownColor.withValues(alpha: 0.1),
                  foregroundColor: ColorGlobalVariables.brownColor,
                ),
                child: const Text('Check Payment Status'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSteps(bool isDarkMode) {
    final steps = _type == 'upload' 
        ? [
            _buildProgressStep('Payment Verified', true, isDarkMode),
            _buildProgressStep('Loading Vehicle Data', _isUploading, isDarkMode),
            _buildProgressStep('Validating Data', _isUploading, isDarkMode),
            _buildProgressStep('Uploading to Server', _isUploading, isDarkMode),
            _buildProgressStep('Complete', _uploadComplete, isDarkMode),
          ]
        : [
            _buildProgressStep('Payment Verified', true, isDarkMode),
            _buildProgressStep('Loading Promotion Data', _isPromoting, isDarkMode),
            _buildProgressStep('Validating Data', _isPromoting, isDarkMode),
            _buildProgressStep('Activating Promotion', _isPromoting, isDarkMode),
            _buildProgressStep('Complete', _promotionComplete, isDarkMode),
          ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF424242) : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDarkMode ? const Color(0xFF616161) : Colors.grey[300]!),
      ),
      child: Column(
        children: steps,
      ),
    );
  }

  Widget _buildProgressStep(String text, bool isActive, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isActive ? ColorGlobalVariables.greenColor : (isDarkMode ? Colors.grey[600] : Colors.grey[300]),
              shape: BoxShape.circle,
            ),
            child: isActive 
                ? const Icon(Icons.check, size: 14, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: isActive ? (isDarkMode ? Colors.white : Colors.black87) : (isDarkMode ? Colors.white60 : Colors.grey[600]),
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getStatusIcon() {
    if (_isUploading) return Icons.cloud_upload_rounded;
    if (_isPromoting) return Icons.trending_up_rounded;
    if (_isProcessing) return Icons.verified_user_rounded;
    if (_paymentVerified) return Icons.check_circle_rounded;
    return Icons.payment_rounded;
  }

  Widget _buildPaymentSuccess(bool isDarkMode) {
    return Container(
      color: isDarkMode ? const Color(0xFF303030) : Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: ColorGlobalVariables.greenColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_rounded,
                size: 60,
                color: ColorGlobalVariables.greenColor,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Payment Successful!',
              style: TextStyle(
                color: ColorGlobalVariables.greenColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _type == 'upload' 
                  ? 'Your vehicle has been uploaded successfully!'
                  : 'Your promotion has been activated successfully!',
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.grey[600],
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Reference: $_reference',
              style: TextStyle(
                color: isDarkMode ? Colors.white60 : Colors.grey[500],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 32),
            if (_isUploading || _isPromoting) ...[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.greenColor),
              ),
              const SizedBox(height: 16),
              Text(
                _isUploading ? 'Finalizing vehicle upload...' : 'Finalizing promotion...',
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentFailed(bool isDarkMode) {
    return Container(
      color: isDarkMode ? const Color(0xFF303030) : Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: ColorGlobalVariables.redColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 60,
                  color: ColorGlobalVariables.redColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Payment Failed',
                style: TextStyle(
                  color: ColorGlobalVariables.redColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _errorMessage,
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.grey[600],
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              if (_detailedError.isNotEmpty) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xFF424242) : Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Detailed Error:',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white70 : Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _detailedError.length > 200 
                            ? '${_detailedError.substring(0, 200)}...' 
                            : _detailedError,
                        style: TextStyle(
                          color: isDarkMode ? Colors.white60 : Colors.grey[600],
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 8),
              Text(
                'Reference: $_reference',
                style: TextStyle(
                  color: isDarkMode ? Colors.white60 : Colors.grey[500],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _handleCancelPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? const Color(0xFF616161) : Colors.grey[300],
                      foregroundColor: isDarkMode ? Colors.white70 : Colors.grey[700],
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _handlePaymentRetry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorGlobalVariables.brownColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _manualVerifyPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.blue[900]!.withValues(alpha: 0.3) : Colors.blue[50],
                  foregroundColor: isDarkMode ? Colors.blue[200] : Colors.blue[700],
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Check Payment Status'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWebView(bool isDarkMode) {
    return Stack(
      children: [
        WebViewWidget(controller: _webViewController),
        if (_isLoading && !_paymentVerified && !_paymentFailed)
          Container(
            color: isDarkMode ? const Color(0xFF303030) : Colors.white,
            child: _buildLoadingIndicator(isDarkMode),
          ),
        if (_showManualNavigationButton && !_paymentVerified && !_paymentFailed && !_isProcessing)
          _buildManualNavigationButton(isDarkMode),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: isDarkMode ? Colors.white : Colors.black87),
          onPressed: _handleCancelPayment,
        ),
        title: Text(
          _type == 'upload' ? 'Purchase Upload Package' : 'Promote Listing',
          style: TextStyle(
            color: isDarkMode ? Colors.white : ColorGlobalVariables.brownColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          if (!_paymentVerified && !_paymentFailed)
            IconButton(
              icon: Icon(Icons.refresh, color: isDarkMode ? Colors.white : Colors.black),
              onPressed: _manualVerifyPayment,
              tooltip: 'Check Payment Status',
            ),
        ],
      ),
      body: _paymentVerified
          ? _buildPaymentSuccess(isDarkMode)
          : _paymentFailed
              ? _buildPaymentFailed(isDarkMode)
              : _buildWebView(isDarkMode),
    );
  }
}
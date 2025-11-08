import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Models/packageModel.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Providers/packageProvider.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Services/PaystackService/paystackService.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/themeProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:logger/Logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PromotionsPage extends StatefulWidget {
  final Map<String, dynamic>? allJson;

  const PromotionsPage({
    super.key,
    this.allJson,
  });

  @override
  State<PromotionsPage> createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {
  final Logger _logger = Logger();
  bool _isProcessing = false;
  int? _selectedIndex;
  final PageController _pageController = PageController(viewportFraction: 0.85);
  bool _initialized = false;

  late String _packageType;
  late Map<String, dynamic> listing;
  Map<String, dynamic> _vehicleData = {};
  String _vehicleName = 'Vehicle Upload';

  // Color schemes for different package tiers
  final List<Map<String, dynamic>> _colorSchemes = [
    {
      'gradient': [Color(0xFF6366F1), Color(0xFF8B5CF6)],
      'icon': FeatherIcons.star,
      'iconColor': Colors.amber,
    },
    {
      'gradient': [Color(0xFF059669), Color(0xFF10B981)],
      'icon': FeatherIcons.award,
      'iconColor': Colors.teal,
    },
    {
      'gradient': [Color(0xFFDC2626), Color(0xFFEA580C)],
      'icon': FontAwesomeIcons.crown,
      'iconColor': Colors.orange,
    },
    {
      'gradient': [Color(0xFF7C3AED), Color(0xFFC026D3)],
      'icon': FeatherIcons.trendingUp,
      'iconColor': Colors.purple,
    },
    {
      'gradient': [Color(0xFF0EA5E9), Color(0xFF06B6D4)],
      'icon': FeatherIcons.zap,
      'iconColor': Colors.blue,
    },
    {
      'gradient': [Color(0xFFF59E0B), Color(0xFFD97706)],
      'icon': Icons.diamond_outlined,
      'iconColor': Colors.yellow,
    },
  ];

  Map<String, dynamic> _getColorScheme(int index) {
    return _colorSchemes[index % _colorSchemes.length];
  }

  @override
  void initState() {
    super.initState();
    _initializeFromArguments();
    _loadVehicleDataFromStorage();
  }

  void _initializeFromArguments() {
    // Get arguments from both GetX navigation and widget constructor
    final getXArguments = Get.arguments as Map<String, dynamic>? ?? {};
    final constructorArguments = widget.allJson ?? {};
    
    // Merge arguments (GetX arguments take priority over constructor arguments)
    final allArguments = {...constructorArguments, ...getXArguments};
    
    _packageType = allArguments['type'] ?? 'upload';
    listing = widget.allJson?['listing'];
    _logger.e('listing: $listing');
    
    _logger.i("PromotionsPage initialized with:");
    _logger.i("  - GetX arguments: $getXArguments");
    _logger.i("  - Constructor arguments: $constructorArguments");
    _logger.i("  - Final package_type: $_packageType");
  }

  Future<void> _loadVehicleDataFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final vehicleDataString = prefs.getString('pending_vehicle_data');
      
      if (vehicleDataString != null && vehicleDataString.isNotEmpty) {
        _vehicleData = jsonDecode(vehicleDataString);
        _vehicleName = _vehicleData['name']?.toString() ?? 'Vehicle Upload';
        
        _logger.i("✅ Vehicle data loaded from SharedPreferences:");
        _logger.i("  - Vehicle name: $_vehicleName");
        _logger.i("  - Data keys: ${_vehicleData.keys.toList()}");
        _logger.i("  - Images count: ${_vehicleData['images']?.length ?? 0}");
        
        if (mounted) {
          setState(() {});
        }
      } else {
        _logger.w("⚠️ No vehicle data found in SharedPreferences");
        _vehicleName = 'Vehicle Upload';
        _vehicleData = {};
      }
    } catch (e, stackTrace) {
      _logger.e("❌ ERROR loading vehicle data from storage: $e, stackTrace: $stackTrace");
      _vehicleName = 'Vehicle Upload';
      _vehicleData = {};
    }
  }

  Future<void> _savePaymentIntentToStorage(String reference, Map<String, dynamic> promotion, Map<String, dynamic> vehicleData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      final paymentIntentData = {
        'reference': reference,
        'packageId': promotion['id'],
        'packageName': promotion['name'],
        'packageType': _packageType,
        'amount': (promotion['price'] * 100).toInt(),
        'durationDays': promotion['durationDays'],
        'vehicleData': vehicleData,
        'timestamp': DateTime.now().toIso8601String(),
      };
      
      await prefs.setString('payment_intent_$reference', json.encode(paymentIntentData));
      _logger.i("✅ Payment intent saved to storage with reference: $reference");
    } catch (e, stackTrace) {
      _logger.e("❌ ERROR saving payment intent: $e, stackTrace: $stackTrace");
    }
  }

  Future<void> _clearVehicleDataAfterPayment() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('pending_vehicle_data');
      _logger.i("✅ Vehicle data cleared from storage after payment");
    } catch (e) {
      _logger.e("❌ ERROR clearing vehicle data: $e");
    }
  }

  // Filter packages by package_type and convert to UI format
  List<Map<String, dynamic>> _getFilteredUIPackages(List<Package> allPackages) {
    // Filter packages based on package_type from arguments
    final filteredPackages = allPackages.where((package) {
      return package.packageType == _packageType;
    }).toList();

    _logger.i("Filtered packages for type '$_packageType': ${filteredPackages.length} packages found");

    // Convert filtered packages to UI format
    return filteredPackages.asMap().entries.map((entry) {
      final package = entry.value;
      final index = entry.key;
      final colorScheme = _getColorScheme(index);
      
      // Use the helper to parse the price
      final price = PackageHelper.parsePrice(package);
      
      bool isPopular = index == 1;
      String description = package.description ?? 'Boost your listing visibility';
      
      // Get currency symbol from country data
      final currencySymbol = package.country?.currencySymbol ?? 'GH₵';
      
      List<String> features = [];
      
      // Customize features based on package_type
      if (_packageType == 'upload') {
        // Only add listing count feature if numberOfListings is not null
        if (package.numberOfListings != null) {
          features.add('${package.numberOfListings} listing${package.numberOfListings! > 1 ? 's' : ''}');
        }
        
        features.addAll([
          'Premium visibility',
          '24/7 customer support',
        ]);
        
        if (package.numberOfListings != null && package.numberOfListings! > 1) {
          features.add('Multiple listing support');
        }
      } else if (_packageType == 'promotion') {
        final promotionDays = package.promotionDays ?? 7;
        features = [
          '$promotionDays days promotion',
          'Featured listing placement',
          'Increased visibility',
          'Priority in search results',
        ];
      }
      
      if (price > 50) {
        features.add('Priority placement');
        features.add('Enhanced analytics');
      }
      
      if (price > 100) {
        features.add('Featured listing');
        features.add('Social media promotion');
      }

      return {
        "id": package.id,
        "startText": _packageType == 'promotion' 
            ? "${package.promotionDays ?? 7} Days" 
            : package.numberOfListings != null 
                ? "${package.numberOfListings} Listings" 
                : "Unlimited Listings",
        "endText": "$currencySymbol ${price.toStringAsFixed(2)}",
        "price": price,
        "durationDays": package.promotionDays ?? 7,
        "name": package.name,
        "description": description,
        "icon": colorScheme['icon'],
        "color": colorScheme['iconColor'],
        "gradient": colorScheme['gradient'],
        "features": features,
        "popular": isPopular,
        "packageType": package.packageType,
        "currencySymbol": currencySymbol,
        "numberOfListings": package.numberOfListings,
      };
    }).toList();
  }

  Future<void> _handlePromotionSelection(int index, List<Map<String, dynamic>> uiPackages) async {
    if (_isProcessing) return;

    final promotion = uiPackages[index];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;

    if (user == null) {
      Get.snackbar(
        'Login Required',
        'Please login to purchase upload package',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Validate that we have vehicle data for upload packages
    if (_packageType == 'upload' && _vehicleData.isEmpty) {
      Get.snackbar(
        'Vehicle Data Missing',
        'Please go back and fill in your vehicle details first',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    setState(() {
      _selectedIndex = index;
      _isProcessing = true;
    });

    try {
      final reference = LegacyPaystackService.generateReference();
      
      // Convert price to int for Paystack (kobo/cent amount)
      final amountInKobo = (promotion['price'] * 100).toInt();
      
      // Save payment intent to storage for recovery
      await _savePaymentIntentToStorage(reference, promotion, _vehicleData);
      
      _logger.i("💰 Payment details:");
      _logger.i("  - Reference: $reference");
      _logger.i("  - Amount: $amountInKobo");
      _logger.i("  - Package: ${promotion['name']}");
      _logger.i("  - Vehicle: $_vehicleName");
      
      final result = await LegacyPaystackService.initializeTransaction(
        context: context,
        amount: amountInKobo,
        reference: reference,
        packageId: promotion['id'],
        packageName: promotion['name'],
        listingId: 'pending_vehicle_upload',
        listingName: _vehicleName,
        durationDays: promotion['durationDays'],
      );

      if (result['status'] == true) {
        final authorizationUrl = result['data']['authorization_url'];
        
        // Prepare payment data
        final paymentData = {
          'authorizationUrl': authorizationUrl,
          'reference': reference,
          'amount': amountInKobo,
          'packageName': promotion['name'],
          'listingName': _vehicleName,
          'listingId': 'pending_vehicle_upload',
          'packageId': promotion['id'],
          'durationDays': promotion['durationDays'],
          'type': _packageType,
          'vehicle_data': _vehicleData,
          // 'return_to_upload': _packageType == 'upload',
        };
        
        _logger.i("✅ Payment initialized successfully, navigating to WebView");
        
        // Navigate to payment page and wait for result
        final paymentResult = await Get.toNamed(
          RouteClass.getWebViewPaymentPage(),
          arguments: paymentData,
        );
        
        // Handle payment result callback
        if (paymentResult == true && mounted) {
          // Return success to the original upload page
          Get.back(result: true);
        }
      } else {
        throw Exception('Failed to initialize payment: ${result['message']}');
      }
    } catch (e) {
      _logger.e('Payment initialization error: $e');
      Get.snackbar(
        'Payment Error',
        'Failed to initialize payment. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
          _selectedIndex = null;
        });
      }
    }
  }

  void _showPromotionDetails(int index, List<Map<String, dynamic>> uiPackages) {
    final promotion = uiPackages[index];
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildPromotionDetailsSheet(promotion, index, uiPackages),
    );
  }

  Widget _buildPromotionDetailsSheet(Map<String, dynamic> promotion, int index, List<Map<String, dynamic>> uiPackages) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final isDarkMode = themeProvider.isDarkMode;
    final listingFeature = promotion['features'].isNotEmpty ? promotion['features'][0] : 'Premium features';

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF424242) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[600] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: promotion['gradient'],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(promotion['icon'], color: Colors.white, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        promotion['name'],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                      Text(
                        promotion['description'],
                        style: TextStyle(
                          color: isDarkMode ? Colors.white60 : Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: _packageType == 'upload' 
                              ? (isDarkMode ? Colors.blue[900]!.withOpacity(0.3) : Colors.blue[50]) 
                              : (isDarkMode ? Colors.green[900]!.withOpacity(0.3) : Colors.green[50]),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _packageType == 'upload' ? 'UPLOAD PACKAGE' : 'PROMOTION PACKAGE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: _packageType == 'upload' 
                                ? (isDarkMode ? Colors.blue[200] : Colors.blue[700]) 
                                : (isDarkMode ? Colors.green[200] : Colors.green[700]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: (promotion['gradient'] as List<Color>)[0].withOpacity(isDarkMode ? 0.2 : 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: (promotion['gradient'] as List<Color>)[0].withOpacity(isDarkMode ? 0.4 : 0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildDetailItem(Icons.calendar_today, promotion['startText'], isDarkMode),
                  _buildDetailItem(Icons.attach_money, promotion['endText'], isDarkMode),
                  _buildDetailItem(Icons.list_alt, listingFeature.toString(), isDarkMode),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Text(
              'What\'s Included:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            ...(promotion['features'] as List<dynamic>).map<Widget>((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, size: 20, color: isDarkMode ? Colors.green[300] : Colors.green),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      feature.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: isDarkMode ? Colors.white70 : Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  _handlePromotionSelection(index, uiPackages);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: (promotion['gradient'] as List<Color>)[0],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  _packageType == 'upload' ? 'Purchase Upload Package' : 'Purchase Promotion Package',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text, bool isDarkMode) {
    return Column(
      children: [
        Icon(icon, size: 20, color: isDarkMode ? Colors.white70 : Colors.grey[600]),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: isDarkMode ? Colors.white70 : Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPromotionCard(Map<String, dynamic> promotion, int index, List<Map<String, dynamic>> uiPackages) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final isDarkMode = themeProvider.isDarkMode;
    
    final isSelected = _selectedIndex == index;
    final gradientColors = promotion['gradient'] as List<Color>;
    final currencySymbol = promotion['currencySymbol'] ?? 'GH₵';
    final numberOfListings = promotion['numberOfListings'];

    return GestureDetector(
      onTap: () => _showPromotionDetails(index, uiPackages),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: gradientColors[0].withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF424242) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: gradientColors[0].withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(promotion['icon'], size: 20, color: gradientColors[0]),
                        ),
                        if (promotion['popular'] == true)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'POPULAR',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    Text(
                      promotion['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      promotion['description'],
                      style: TextStyle(
                        color: isDarkMode ? Colors.white60 : Colors.grey[600],
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: _packageType == 'upload' 
                            ? (isDarkMode ? Colors.blue[900]!.withOpacity(0.3) : Colors.blue[50]) 
                            : (isDarkMode ? Colors.green[900]!.withOpacity(0.3) : Colors.green[50]),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        _packageType == 'upload' ? 'UPLOAD' : 'PROMOTION',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: _packageType == 'upload' 
                              ? (isDarkMode ? Colors.blue[200] : Colors.blue[700]) 
                              : (isDarkMode ? Colors.green[200] : Colors.green[700]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _packageType == 'upload' ? 'Listings' : 'Duration',
                              style: TextStyle(
                                color: isDarkMode ? Colors.white60 : Colors.grey[500],
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              promotion['startText'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black87,
                              ),
                            ),
                            // Show number of listings for upload packages if available
                            if (_packageType == 'upload' && numberOfListings != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  '${numberOfListings} items',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isDarkMode ? Colors.green[300] : Colors.green[700],
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: isDarkMode ? Colors.white60 : Colors.grey[500],
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              promotion['endText'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: gradientColors[0],
                              ),
                            ),
                          ],
                        ),
                      ], 
                    ),
                    const SizedBox(height: 16),

                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        ...(promotion['features'] as List<dynamic>).take(2).map((feature) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: gradientColors[0].withOpacity(isDarkMode ? 0.2 : 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            feature.toString().length > 15 ? '${feature.toString().substring(0, 15)}...' : feature.toString(),
                            style: TextStyle(
                              fontSize: 10,
                              color: gradientColors[0],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )).toList(),
                        if ((promotion['features'] as List<dynamic>).length > 2)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '+${(promotion['features'] as List<dynamic>).length - 2} more',
                              style: TextStyle(
                                fontSize: 10,
                                color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            if (isSelected)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: gradientColors[0].withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: _isProcessing
                        ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white))
                        : const Icon(Icons.check_circle, size: 40, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Load packages only once and only if user is logged in
    if (!_initialized) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final packageProvider = Provider.of<PackageProvider>(context, listen: false);
      
      if (userProvider.user != null) {
        _initialized = true;
        // Use Future.microtask to schedule the call after the current build phase
        Future.microtask(() {
          if (mounted) {
            packageProvider.getPackages(categoryId: listing['category_id']);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : const Color(0xFFF8FAFD),
      body: Consumer<PackageProvider>(
        builder: (context, packageProvider, child) {
          // Get filtered packages based on package_type
          final uiPackages = _getFilteredUIPackages(packageProvider.packages);

          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF424242) : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDarkMode ? 0.2 : 0.12),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isDarkMode ? const Color(0xFF616161) : Colors.grey[100],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_back, size: 20, color: isDarkMode ? Colors.white70 : Colors.grey),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _packageType == 'upload' ? "Upload Packages" : "Promotion Packages",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode ? Colors.white : Colors.black87,
                                ),
                              ),
                              Text(
                                "$_vehicleName - ${_packageType == 'upload' ? 'Upload' : 'Promotion'}",
                                style: TextStyle(
                                  color: isDarkMode ? Colors.white60 : Colors.grey[600],
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.blue[900]!.withOpacity(0.3) : Colors.blue[50],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.help_outline, size: 20, color: isDarkMode ? Colors.blue[200] : Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: packageProvider.isLoading
                    ? Center(
                      child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Loading packages...',
                                  style: TextStyle(
                                    color: isDarkMode ? Colors.white70 : Colors.grey[600],
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                      )
                    : packageProvider.error != null
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.error_outline, size: 64, color: isDarkMode ? Colors.red[400] : Colors.red[300]),
                                const SizedBox(height: 16),
                                Text(
                                  'Failed to load packages',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isDarkMode ? Colors.white70 : Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  packageProvider.error!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isDarkMode ? Colors.white60 : Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : uiPackages.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.inventory_2_outlined, size: 64, color: isDarkMode ? Colors.grey[400] : Colors.grey),
                                    const SizedBox(height: 16),
                                    Text(
                                      'No ${_packageType == 'upload' ? 'upload' : 'promotion'} packages available',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: isDarkMode ? Colors.white70 : Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Please check back later for ${_packageType == 'upload' ? 'upload' : 'promotion'} packages',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isDarkMode ? Colors.white60 : Colors.grey[500],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                            : SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _packageType == 'upload' 
                                                ? "Choose Your Upload Package" 
                                                : "Boost Your Listing",
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: isDarkMode ? Colors.white : Colors.black87,
                                              height: 1.2,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            _packageType == 'upload'
                                                ? "Select an upload package to list your vehicle and reach potential buyers"
                                                : "Select a promotion package to increase visibility and get more buyers for your listing",
                                            style: TextStyle(
                                              color: isDarkMode ? Colors.white60 : Colors.grey,
                                              fontSize: 14,
                                              height: 1.4,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 32),

                                    SizedBox(
                                      height: 500,
                                      child: PageView.builder(
                                        controller: _pageController,
                                        itemCount: uiPackages.length,
                                        itemBuilder: (context, index) => 
                                            _buildPromotionCard(uiPackages[index], index, uiPackages),
                                        padEnds: false,
                                        pageSnapping: true,
                                      ),
                                    ),
                                    const SizedBox(height: 24),

                                    Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(uiPackages.length, (index) {
                                          return Container(
                                            width: 8,
                                            height: 8,
                                            margin: const EdgeInsets.symmetric(horizontal: 4),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: _pageController.hasClients && 
                                                    (_pageController.page?.round() == index || 
                                                     _pageController.page == index)
                                                  ? Colors.blue
                                                  : isDarkMode ? Colors.grey[600] : Colors.grey[300],
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
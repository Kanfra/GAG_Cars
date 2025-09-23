// lib/Pages/Payment/webview_payment_page.dart
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Services/PaystackService/paystackService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:logger/Logger.dart';

class WebViewPaymentPage extends StatefulWidget {
  final Map<String, dynamic> allJson;

  const WebViewPaymentPage({
    super.key,
    required this.allJson,
  });

  @override
  State<WebViewPaymentPage> createState() => _WebViewPaymentPageState();
}

class _WebViewPaymentPageState extends State<WebViewPaymentPage> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _paymentVerified = false;
  bool _isVerifying = false;
  bool _hasTriggeredVerification = false;
  final Logger _logger = Logger();

  @override
  void initState() {
    super.initState();
    _logger.e("listing at webviewpaymentpage: ${widget.allJson['listingName']}");
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          setState(() => _isLoading = true);
          _logger.i('WebView page started loading: $url');
        },
        onPageFinished: (String url) {
          setState(() => _isLoading = false);
          _logger.i('WebView page finished loading: $url');
          
          // Additional check for callback URLs on page finish
          if ((url.contains('gagcars.com/payment-callback') || 
               url.contains('trxref=') || 
               url.contains('reference=')) &&
              !_hasTriggeredVerification) {
            _logger.i('Callback URL detected on page finish: $url');
            _triggerVerification();
          }
        },
        onNavigationRequest: (NavigationRequest request) {
          _logger.i('Navigation request: ${request.url}');
          
          // Check for Paystack callback URL patterns
          if ((request.url.contains('gagcars.com/payment-callback') || 
               request.url.contains('trxref=') || 
               request.url.contains('reference=')) &&
              !_hasTriggeredVerification) {
            _logger.i('Callback URL detected in navigation: ${request.url}');
            _triggerVerification();
          }
          return NavigationDecision.navigate;
        },
        onUrlChange: (UrlChange change) {
          _logger.i('URL changed to: ${change.url}');
        },
      ))
      ..loadRequest(Uri.parse(widget.allJson['authorizationUrl']));
      
    _logger.i('WebView initialized with authorization URL: ${widget.allJson['authorizationUrl']}');
  }

  void _triggerVerification() {
    if (_hasTriggeredVerification) {
      _logger.w('Verification already triggered, skipping');
      return;
    }
    
    _hasTriggeredVerification = true;
    _logger.i('Triggering payment verification');
    
    // Wait a moment to ensure the callback page fully processes and Paystack completes
    Future.delayed(const Duration(seconds: 3), () {
      _logger.i('Delay completed, starting verification process');
      _verifyPaymentAndActivatePromotion();
    });
  }

  Future<void> _verifyPaymentAndActivatePromotion() async {
    if (_paymentVerified) {
      _logger.w('Payment already verified, skipping');
      return;
    }
    
    if (_isVerifying) {
      _logger.w('Verification already in progress, skipping');
      return;
    }
    
    _logger.i('Starting payment verification process');
    
    setState(() {
      _isVerifying = true;
      _isLoading = true;
    });
    
    try {
      _logger.i('Calling verifyAndActivatePromotion with reference: ${widget.allJson['reference']}');
      _logger.i('Listing ID: ${widget.allJson['listingId']}, Package ID: ${widget.allJson['packageId']}');
      
      final result = await LegacyPaystackService.verifyAndActivatePromotion(
        reference: widget.allJson['reference'],
        listingId: widget.allJson['listingId'],
        packageId: widget.allJson['packageId'],
        packageName: widget.allJson['packageName'],
        amount: widget.allJson['amount'],
        durationDays: widget.allJson['durationDays'],
      );
      
      // Log the complete result
      _logger.i('Service result: ${result.toString()}');
      _logger.i('Success value: ${result['success']} (type: ${result['success'].runtimeType})');
      _logger.i('Message: ${result['message']}');
      
      setState(() => _paymentVerified = true);
      
      if (result['success'] == true) {
        _logger.i('Navigation to SUCCESS page');
        
        // NULL-SAFE FIX: Create null-safe arguments
        final successArgs = {
          'transactionReference': widget.allJson['reference']?.toString() ?? 'N/A',
          'amount': widget.allJson['amount']?.toString() ?? '0.0',
          'packageName': widget.allJson['packageName']?.toString() ?? 'Unknown Package',
          'listingName': widget.allJson['listingName']?.toString() ?? 'Unknown Listing',
        };
        
        _logger.i('Success page arguments: $successArgs');
        
        // SAFE NAVIGATION: Get the route name first and check if it's valid
        final successRoute = RouteClass.getPaymentSuccessPage();
        _logger.i('Success route: $successRoute');
        
        if (successRoute.isNotEmpty) {
          Get.offNamed(
            successRoute,
            arguments: successArgs,
          );
        } else {
          _logger.e('Success route is empty!');
          _showNavigationError('Success route not configured');
        }
      } else {
        _logger.w('Navigation to FAILED page - success was false');
        _logger.w('Failure reason: ${result['message']}');
        
        // NULL-SAFE FIX: Create null-safe arguments for failed page too
        final failedArgs = {
          'errorMessage': result['message']?.toString() ?? 'Payment verification failed',
          'transactionReference': widget.allJson['reference']?.toString() ?? 'N/A',
        };
        
        // SAFE NAVIGATION: Get the route name first and check if it's valid
        final failedRoute = RouteClass.getPaymentFailedPage();
        _logger.i('Failed route: $failedRoute');
        
        if (failedRoute.isNotEmpty) {
          Get.offNamed(
            failedRoute,
            arguments: failedArgs,
          );
        } else {
          _logger.e('Failed route is empty!');
          _showNavigationError('Failed route not configured');
        }
      }
    } catch (e, stackTrace) {
      _logger.e('Exception caught during verification: $e');
      _logger.e('Stack trace: $stackTrace');
      
      // Use a safer navigation approach for errors
      _showNavigationError('Payment verification error: ${e.toString()}');
    } finally {
      setState(() => _isVerifying = false);
      _logger.i('Verification process completed');
    }
  }

  void _showNavigationError(String errorMessage) {
    // Fallback navigation using simple dialog instead of GetX named routes
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Status'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate back to previous screen
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Payment'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          if (_isVerifying)
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _logger.i('WebViewPaymentPage disposed');
    super.dispose();
  }
}
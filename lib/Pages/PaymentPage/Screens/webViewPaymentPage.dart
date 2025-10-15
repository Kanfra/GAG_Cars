// lib/Pages/Payment/webview_payment_page.dart
import 'dart:async';

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
  Timer? _verificationTimer;

  @override
  void initState() {
    super.initState();
    _logger.i("🚀 WebView Payment Started");
    _logger.i("📦 Listing: ${widget.allJson['listingName']}");
    _logger.i("🔢 Reference: ${widget.allJson['reference']}");
    _logger.i("💰 Amount: ${widget.allJson['amount']}");
    
    _initializeWebView();
    
    // Start polling for payment status after a delay
    _startPolling();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          setState(() => _isLoading = true);
          _logger.i('🌐 Loading: $url');
        },
        onPageFinished: (String url) {
          setState(() => _isLoading = false);
          _logger.i('✅ Loaded: $url');
          
          // Check if this might be a success page
          _checkUrlForSuccess(url);
        },
        onNavigationRequest: (NavigationRequest request) {
          _logger.i('🧭 Navigating to: ${request.url}');
          _checkUrlForSuccess(request.url);
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse(widget.allJson['authorizationUrl']));
  }

  void _checkUrlForSuccess(String url) {
    // Very broad detection - if URL changes at all after payment started
    if (url != widget.allJson['authorizationUrl'] && 
        !_hasTriggeredVerification && 
        !url.contains('initialize')) {
      _logger.i('🔄 URL changed from original - might be payment completion: $url');
      // Don't auto-trigger, just log it
    }
  }

  void _startPolling() {
    _logger.i('⏰ Starting payment status polling...');
    
    // Start polling after 30 seconds (give user time to pay)
    Future.delayed(const Duration(seconds: 30), () {
      if (!_hasTriggeredVerification && mounted) {
        _logger.i('🔄 Starting automatic polling every 10 seconds');
        _verificationTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
          if (!_hasTriggeredVerification && mounted) {
            _logger.i('🔍 Polling: Checking payment status...');
            _verifyPaymentManually();
          } else {
            _logger.i('⏹️ Stopping polling - verification completed');
            timer.cancel();
          }
        });
      }
    });
  }

  Future<void> _verifyPaymentManually() async {
    if (_hasTriggeredVerification || _isVerifying) {
      _logger.w('⚠️ Verification already in progress');
      return;
    }

    _logger.i('🔄 MANUAL VERIFICATION TRIGGERED');
    
    setState(() {
      _isVerifying = true;
    });

    try {
      final dynamic amountValue = widget.allJson['amount'];
      final int amountInt = _convertToInt(amountValue);
      
      _logger.i('📞 Calling Paystack verification API...');
      
      final result = await LegacyPaystackService.verifyAndActivatePromotion(
        reference: widget.allJson['reference'],
        listingId: widget.allJson['listingId'],
        packageId: widget.allJson['packageId'],
        packageName: widget.allJson['packageName'],
        amount: amountInt,
        durationDays: widget.allJson['durationDays'],
      );
      
      _logger.i('📊 API RESPONSE:');
      _logger.i('   - Success: ${result['success']}');
      _logger.i('   - Message: ${result['message']}');
      
      _hasTriggeredVerification = true;
      
      if (result['success'] == true) {
        _logger.i('🎉 PAYMENT SUCCESSFUL!');
        _navigateToSuccessPage(amountInt);
      } else {
        _logger.w('❌ Payment not completed yet: ${result['message']}');
        // Don't navigate to failure page yet - payment might still be processing
        setState(() {
          _isVerifying = false;
        });
      }
      
    } catch (e) {
      _logger.e('💥 Verification error: $e');
      setState(() {
        _isVerifying = false;
      });
    }
  }

  void _navigateToSuccessPage(int amount) {
    _logger.i('🚀 NAVIGATING TO SUCCESS PAGE');
    
    final successArgs = {
      'transactionReference': widget.allJson['reference'],
      'amount': amount.toString(),
      'packageName': widget.allJson['packageName'],
      'listingName': widget.allJson['listingName'],
    };
    
    final successRoute = RouteClass.getPaymentSuccessPage();
    
    if (successRoute.isNotEmpty) {
      // Stop any ongoing polling
      _verificationTimer?.cancel();
      
      // Navigate using the same method as your other pages
      Get.offAllNamed(successRoute, arguments: successArgs);
      _logger.i('✅ SUCCESSFULLY NAVIGATED TO SUCCESS PAGE');
    } else {
      _logger.e('❌ Success route not found!');
      _showErrorDialog('Success page not available');
    }
  }

  int _convertToInt(dynamic value) {
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  void _showErrorDialog(String message) {
    if (!mounted) return;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Status'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _showExitConfirmation(),
        ),
      ),
      body: Column(
        children: [
          // WebView takes most of the space
          Expanded(
            child: Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (_isLoading)
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Loading payment page...'),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          
          // Manual verification section - ALWAYS VISIBLE
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.grey[50],
            child: Column(
              children: [
                Text(
                  'Payment Reference: ${widget.allJson['reference']}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                
                if (_isVerifying)
                  const Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 8),
                      Text('Verifying payment...'),
                    ],
                  )
                else if (_paymentVerified)
                  const Text(
                    'Payment verified successfully!',
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  )
                else
                  Column(
                    children: [
                      const Text(
                        'After completing payment in the webview above:',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _verifyPaymentManually,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('I have completed payment - Verify Now'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'We will automatically check every 10 seconds',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showExitConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit Payment?'),
          content: const Text('If you exit, you can always verify your payment later using the reference.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Continue Payment'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.back();
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _logger.i('♻️ WebViewPaymentPage disposed');
    _verificationTimer?.cancel();
    super.dispose();
  }
}
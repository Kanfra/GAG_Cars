// lib/Pages/Payment/payment_processing_page.dart
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/themeProvider.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';

class PaymentProcessingPage extends StatefulWidget {
  final Map<String, dynamic> allJson;

  const PaymentProcessingPage({
    super.key,
    required this.allJson,
  });

  @override
  State<PaymentProcessingPage> createState() => _PaymentProcessingPageState();
}

class _PaymentProcessingPageState extends State<PaymentProcessingPage> {
  final logger = Logger();

  @override
  void initState(){
    super.initState();
    logger.e("Package name: ${widget.allJson['packageName']} and amount: ${widget.allJson['amount']}");
  }
  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Processing Animation
              SpinKitFadingCircle(
                color: isDarkMode ? Colors.blue[300] : Colors.blue,
                size: 60.0,
              ),
              const SizedBox(height: 32),

              // Processing Message
              Text(
                'Processing Payment',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Package Info
              Text(
                widget.allJson['packageName'],
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode ? Colors.white70 : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Amount
              Text(
                'GH₵ ${widget.allJson['amount'].toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.green[300] : Colors.green,
                ),
              ),
              const SizedBox(height: 32),

              // Progress Info
              LinearProgressIndicator(
                backgroundColor: isDarkMode ? Colors.grey[700] : Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isDarkMode ? Colors.blue[300]! : Colors.blue
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Please wait while we process your payment...',
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Do not close this screen or exit the app',
                style: TextStyle(
                  color: isDarkMode ? Colors.orange[300] : Colors.orange,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // Security Badges
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSecurityBadge(Icons.security, 'Secure', isDarkMode),
                  const SizedBox(width: 16),
                  _buildSecurityBadge(Icons.lock, 'Encrypted', isDarkMode),
                  const SizedBox(width: 16),
                  _buildSecurityBadge(Icons.verified_user, 'Verified', isDarkMode),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityBadge(IconData icon, String text, bool isDarkMode) {
    return Column(
      children: [
        Icon(
          icon, 
          size: 20, 
          color: isDarkMode ? Colors.green[300] : Colors.green
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            color: isDarkMode ? Colors.white70 : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
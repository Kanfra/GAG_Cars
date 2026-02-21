// lib/Pages/Payment/payment_failed_page.dart
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/themeProvider.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Screens/myListingPage.dart';
import 'package:get/get.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:provider/provider.dart';

class PaymentFailedPage extends StatelessWidget {
  final Map<String, dynamic> allJson;

  const PaymentFailedPage({super.key, required this.allJson});

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
              // Error Icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
              ),
              const SizedBox(height: 32),

              // Error Message
              Text(
                'Payment Failed',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Amount
              Text(
                '${Provider.of<UserProvider>(context, listen: false).user?.countryCurrencySymbol ?? ''} ${(allJson['amount'] as num?)?.toStringAsFixed(2) ?? '0.00'}',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              // Error Details
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? Colors.red[900]!.withValues(alpha: 0.3)
                      : Colors.red[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDarkMode ? Colors.red[700]! : Colors.red[100]!,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.warning_amber,
                      color: isDarkMode ? Colors.red[300] : Colors.red,
                      size: 24,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      allJson['errorMessage'],
                      style: TextStyle(
                        color: isDarkMode ? Colors.red[200] : Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Reference Number
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF424242) : Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDarkMode
                        ? const Color(0xFF616161)
                        : Colors.grey[200]!,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt,
                      size: 16,
                      color: isDarkMode ? Colors.white60 : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Ref: ${allJson['transactionReference']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white60 : Colors.grey,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Action Buttons
              Column(
                children: [
                  // Try Again Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Go back to promotions page to try again
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorGlobalVariables.redColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        'Try Again',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Back to Listings Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.offUntil(
                          GetPageRoute(page: () => MyListingPage()),
                          (route) => route.isFirst,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(
                          color: isDarkMode
                              ? Colors.white60
                              : Colors.grey[300]!,
                        ),
                      ),
                      child: Text(
                        'Back to Listings',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? Colors.white70 : Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Support Information
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? Colors.blue[900]!.withValues(alpha: 0.3)
                      : Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'Need Help?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.blue[200] : Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Contact our support team if you need assistance with your payment.',
                      style: TextStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.blue[200] : Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        _contactSupport();
                      },
                      child: Text(
                        'Contact Support',
                        style: TextStyle(
                          color: isDarkMode ? Colors.blue[300] : Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _contactSupport() {
    Get.snackbar(
      'Support',
      'Support contact options will be available soon',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }
}

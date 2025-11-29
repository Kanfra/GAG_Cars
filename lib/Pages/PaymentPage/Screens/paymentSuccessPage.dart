// lib/Pages/Payment/payment_success_page.dart
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/themeProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';

import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:provider/provider.dart';

class PaymentSuccessPage extends StatefulWidget {
  final Map<String, dynamic> allJson;

  const PaymentSuccessPage({
    super.key,
    required this.allJson,
  });

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  final logger = Logger();
  bool _isSharing = false;

  @override
  void initState() {
    super.initState();
    logger.i('✅ Payment success initialized: ${widget.allJson}');
    
    // Show appropriate message based on upload status
    if (widget.allJson['uploadError'] != null) {
      _showUploadErrorSnackbar();
    } else if (widget.allJson['promotionError'] != null) {
      _showPromotionErrorSnackbar();
    }
  }

  void _showUploadErrorSnackbar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCustomSnackBar(
        backgroundColor: ColorGlobalVariables.redColor,
        title: "Upload Failed",
        message: "Payment was successful but vehicle upload failed. Please try uploading again from My Listings.",
        duration: Duration(seconds: 5),
      );
    });
  }

  void _showPromotionErrorSnackbar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCustomSnackBar(
        backgroundColor: ColorGlobalVariables.redColor,
        title: "Promotion Failed", 
        message: "Payment was successful but promotion activation failed. Please contact support.",
        duration: Duration(seconds: 5),
      );
    });
  }

  double _getAmountInGhs() {
    final dynamic amountValue = widget.allJson['amount'];
    
    double amountDouble;
    if (amountValue is int) {
      amountDouble = amountValue.toDouble();
    } else if (amountValue is double) {
      amountDouble = amountValue;
    } else if (amountValue is String) {
      amountDouble = double.tryParse(amountValue) ?? 0.0;
    } else {
      amountDouble = 0.0;
    }
    
    // Convert from kobo to GHS
    return amountDouble / 100;
  }

  // FIXED: Added listen: false for async context
  Future<Uint8List> _generatePdfReceipt() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final pdf = pw.Document();
    final amountInGhs = _getAmountInGhs();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(24),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'GAG CARS - PAYMENT RECEIPT',
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Text('Official Payment Receipt'),
                pw.Divider(),
                pw.SizedBox(height: 20),

                _buildPdfRow('Reference:', widget.allJson['transactionReference']?.toString() ?? 'N/A'),
                pw.SizedBox(height: 10),
                _buildPdfRow('Date:', DateTime.now().toString().split('.').first),
                pw.SizedBox(height: 10),
                _buildPdfRow('Amount:', '${userProvider.user?.countryCurrencySymbol ?? ''} ${amountInGhs.toStringAsFixed(2)}'),
                pw.SizedBox(height: 10),
                _buildPdfRow('Package:', widget.allJson['packageName']?.toString() ?? 'Unknown'),
                pw.SizedBox(height: 10),
                _buildPdfRow('Listing:', widget.allJson['listingName']?.toString() ?? 'Unknown'),
                pw.SizedBox(height: 30),

                pw.Center(
                  child: pw.Text(
                    'Thank you for your payment!',
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildPdfRow(String label, String value) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(label, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.Text(value),
      ],
    );
  }

  Future<void> _shareReceipt() async {
    setState(() => _isSharing = true);

    try {
      // FIXED: Call without context parameter since we're using listen: false
      final pdfBytes = await _generatePdfReceipt();
      await Printing.sharePdf(
        bytes: pdfBytes,
        filename: 'receipt-${widget.allJson['transactionReference'] ?? 'payment'}.pdf',
      );
    } catch (e) {
      logger.e('Share error: $e');
      Get.snackbar(
        'Error',
        'Failed to share receipt',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      setState(() => _isSharing = false);
    }
  }

  String _getSuccessMessage() {
    final type = widget.allJson['type'] ?? 'upload';
    final uploadError = widget.allJson['uploadError'];
    final promotionError = widget.allJson['promotionError'];
    
    if (uploadError != null) {
      return 'Payment successful but upload failed';
    } else if (promotionError != null) {
      return 'Payment successful but promotion failed';
    } else if (type == 'upload') {
      return 'Your vehicle has been listed successfully!';
    } else {
      return 'Your listing is now being promoted!';
    }
  }

  String _getSubMessage() {
    final type = widget.allJson['type'] ?? 'upload';
    final uploadError = widget.allJson['uploadError'];
    final promotionError = widget.allJson['promotionError'];
    
    if (uploadError != null) {
      return 'Please try uploading again from My Listings';
    } else if (promotionError != null) {
      return 'Please contact support for assistance';
    } else if (type == 'upload') {
      return 'Your vehicle is now visible to potential buyers';
    } else {
      return 'You will receive more visibility and inquiries';
    }
  }

  Color _getStatusColor() {
    final uploadError = widget.allJson['uploadError'];
    final promotionError = widget.allJson['promotionError'];
    
    if (uploadError != null || promotionError != null) {
      return Colors.orange;
    }
    return Colors.green;
  }

  IconData _getStatusIcon() {
    final uploadError = widget.allJson['uploadError'];
    final promotionError = widget.allJson['promotionError'];
    
    if (uploadError != null || promotionError != null) {
      return Icons.warning_amber_rounded;
    }
    return Icons.check_circle;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    
    final amountInGhs = _getAmountInGhs();
    final statusColor = _getStatusColor();
    final statusIcon = _getStatusIcon();
    final successMessage = _getSuccessMessage();
    final subMessage = _getSubMessage();

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(statusIcon, color: statusColor, size: 60),
              ),
              const SizedBox(height: 32),

              Text(
                successMessage,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              Text(
                '${userProvider.user?.countryCurrencySymbol ?? ''} ${amountInGhs.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                widget.allJson['packageName']?.toString() ?? 'Unknown Package',
                style: TextStyle(
                  fontSize: 18, 
                  color: isDarkMode ? Colors.white70 : Colors.grey
                )
              ),
              const SizedBox(height: 4),

              Text(
                widget.allJson['listingName']?.toString() ?? 'Unknown Listing',
                style: TextStyle(
                  fontSize: 14, 
                  color: isDarkMode ? Colors.white60 : Colors.grey
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF424242) : Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDarkMode ? const Color(0xFF616161) : Colors.grey[200]!
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt, 
                      size: 16, 
                      color: isDarkMode ? Colors.white60 : Colors.grey
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Ref: ${widget.allJson['transactionReference']?.toString() ?? 'N/A'}',
                      style: TextStyle(
                        fontSize: 12, 
                        color: isDarkMode ? Colors.white60 : Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(RouteClass.getMyListingPage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorGlobalVariables.redColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Back to My Listings'),
                    ),
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: _isSharing ? null : _shareReceipt,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(
                          color: isDarkMode ? Colors.white60 : Colors.grey[400]!
                        ),
                      ),
                      child: _isSharing
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: isDarkMode ? Colors.white60 : Colors.grey[600],
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.share, 
                                  size: 20,
                                  color: isDarkMode ? Colors.white70 : Colors.grey[700],
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Share Receipt',
                                  style: TextStyle(
                                    color: isDarkMode ? Colors.white70 : Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Text(
                subMessage,
                style: TextStyle(
                  color: statusColor, 
                  fontSize: 14
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
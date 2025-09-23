// lib/Pages/Payment/payment_success_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';

import 'package:gag_cars_frontend/Pages/ProfilePages/Screens/myListingPage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

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
    logger.i('Payment success data: ${widget.allJson}');
  }

  /// Generate PDF Receipt
  Future<Uint8List> _generatePdfReceipt() async {
    final pdf = pw.Document();

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

                _buildPdfRow('Reference:',
                    widget.allJson['transactionReference']?.toString() ?? 'N/A'),
                pw.SizedBox(height: 10),

                _buildPdfRow('Date:',
                    DateTime.now().toString().split('.').first),
                pw.SizedBox(height: 10),

                _buildPdfRow('Amount:',
                    'GH₵ ${widget.allJson['amount']?.toString() ?? '0.00'}'),
                pw.SizedBox(height: 10),

                _buildPdfRow('Package:',
                    widget.allJson['packageName']?.toString() ?? 'Unknown'),
                pw.SizedBox(height: 10),

                _buildPdfRow('Listing:',
                    widget.allJson['listingName']?.toString() ?? 'Unknown'),
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

  /// Share PDF
  Future<void> _shareReceipt() async {
    setState(() => _isSharing = true);

    try {
      final pdfBytes = await _generatePdfReceipt();

      await Printing.sharePdf(
        bytes: pdfBytes,
        filename:
            'receipt-${widget.allJson['transactionReference'] ?? 'payment'}.pdf',
      );
    } catch (e) {
      logger.e('Share error: $e');
      Get.snackbar(
        'Error',
        'Failed to share receipt: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(() => _isSharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle,
                    color: Colors.green, size: 60),
              ),
              const SizedBox(height: 32),

              const Text(
                'Payment Successful!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'GH₵ ${widget.allJson['amount']?.toString() ?? '0.00'}',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              Text(widget.allJson['packageName']?.toString() ?? 'Unknown Package',
                  style: const TextStyle(fontSize: 18, color: Colors.grey)),
              const SizedBox(height: 4),

              Text(
                widget.allJson['listingName']?.toString() ?? 'Unknown Listing',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.receipt, size: 16, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(
                      'Ref: ${widget.allJson['transactionReference']?.toString() ?? 'N/A'}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'monospace',
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
                        Get.offUntil(
                          GetPageRoute(page: () => MyListingPage()),
                          (route) => route.isFirst,
                        );
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
                      ),
                      child: _isSharing
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.share, size: 20),
                                SizedBox(width: 8),
                                Text('Share Receipt'),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Text(
                'Your listing is now being promoted!',
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
              const SizedBox(height: 4),
              const Text(
                'You will receive more visibility and inquiries.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

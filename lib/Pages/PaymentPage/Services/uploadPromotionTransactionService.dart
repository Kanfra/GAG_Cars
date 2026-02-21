import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Models/uploadPromotionTransactionModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class UploadPromotionTransactionService {
  static final Logger logger = Logger();

  Future<void> postTransaction(
    UploadPromotionTransactionModel transaction,
  ) async {
    logger.i("🚀 [TRANSACTION_SERVICE] Starting postTransaction request...");
    try {
      final token = await AuthService.getToken();

      if (token == null) {
        logger.e("❌ [TRANSACTION_SERVICE] Authentication token not found");
        throw Exception('Authentication token not found');
      }

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      };

      final uri = Uri.parse("$baseApiUrl${ApiEndpoint.transactions}");
      final requestBody = json.encode(transaction.toJson());

      logger.i("📡 [TRANSACTION_SERVICE] Sending POST request to: $uri");
      logger.i("📦 [TRANSACTION_SERVICE] Request Body: $requestBody");

      final response = await http
          .post(uri, headers: headers, body: requestBody)
          .timeout(const Duration(seconds: 15));

      logger.i(
        '📥 [TRANSACTION_SERVICE] Response Status: ${response.statusCode}',
      );
      logger.v('📝 [TRANSACTION_SERVICE] Response Body: ${response.body}');

      if (response.statusCode == 200) {
        logger.i(
          '✅ [TRANSACTION_SERVICE] Transaction successfully recorded in database',
        );
      } else if (response.statusCode == 401) {
        logger.e(
          '⚠️ [TRANSACTION_SERVICE] Unauthorized: Token might be expired or invalid',
        );
        throw Exception('Unauthorized. Please log in again.');
      } else if (response.statusCode == 422) {
        logger.e(
          '❌ [TRANSACTION_SERVICE] Unprocessable Entity: Validation Error',
        );
        final errorBody = json.decode(response.body);
        logger.e(
          '📄 [TRANSACTION_SERVICE] Validation details: ${response.body}',
        );
        throw Exception(
          'Validation error: ${errorBody['message'] ?? 'Unknown error'}',
        );
      } else {
        logger.e(
          '❌ [TRANSACTION_SERVICE] Request failed with status code: ${response.statusCode}',
        );
        logger.e('📄 [TRANSACTION_SERVICE] Error Body: ${response.body}');
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      logger.e(
        '💥 [TRANSACTION_SERVICE] Critical error during transaction post: $e',
      );
      rethrow;
    }
  }
}

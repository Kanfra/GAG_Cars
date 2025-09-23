// lib/Services/PromotionService/promotion_service.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PromotionService {
  static final Logger _logger = Logger();

  // Activate promotion after successful payment
  // UPDATED: Removed parameters that are not part of the API contract
  static Future<Map<String, dynamic>> activatePromotion({
    required String itemId,
    required String startAt,
    required String endAt,
    required String status,
    // REMOVED: transactionReference, packageId, amount
  }) async {
    final uri = Uri.parse('$baseApiUrl/promotions');
    try {
      _logger.i('Activating promotion for item: $itemId');
      final token = await AuthService.getToken();
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // UPDATED: Body now only contains the fields the API expects
        body: json.encode({
          'item_id': itemId,
          'start_at': startAt,
          'end_at': endAt,
          'status': status,
          // REMOVED: 'transaction_reference', 'package_id', 'amount', 'activated_at'
        }),
      );

      _logger.i('Promotion API response: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = json.decode(response.body);
        _logger.i('Promotion activated successfully: $result');
        return {
          'success': true,
          'message': 'Promotion activated successfully',
          'data': result,
        };
      } else {
        _logger.e('Failed to activate promotion: ${response.statusCode} - ${response.body}');
        return {
          'success': false,
          'message': 'Failed to activate promotion: ${response.statusCode}',
          'error': response.body,
        };
      }
    } catch (e) {
      _logger.e('Error activating promotion: $e');
      return {
        'success': false,
        'message': 'Error activating promotion: ${e.toString()}',
        'error': e.toString(),
      };
    }
  }

  // Calculate promotion start and end dates based on package duration
  static Map<String, String> calculatePromotionDates(int durationDays) {
    final now = DateTime.now();
    final endDate = now.add(Duration(days: durationDays));
    
    return {
      'start_at': now.toIso8601String(),
      'end_at': endDate.toIso8601String(),
    };
  }
}
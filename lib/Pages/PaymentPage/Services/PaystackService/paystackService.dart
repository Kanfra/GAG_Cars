// lib/Services/PaystackService/legacy_paystack_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/DeviceInfoUtils.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Services/PromotionService/promotionService.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';

class LegacyPaystackService {
  static final logger = Logger();
  
  // CORRECT PAYSTACK API BASE URL
  static const String _paystackBaseUrl = 'https://api.paystack.co';
  
  static Map<String, dynamic> get getPaystackKeys {
    final paystackPublicKey = dotenv.env['PAYSTACK_PUBLIC_KEY'];
    final paystackSecretKey = dotenv.env['PAYSTACK_SECRET_KEY'];
    if (paystackPublicKey == null || paystackPublicKey.isEmpty) {
      throw Exception('PAYSTACK_PUBLIC_KEY not found in .env file');
    }
    if (paystackSecretKey == null || paystackSecretKey.isEmpty) {
      throw Exception('PAYSTACK_SECRET_KEY not found in .env file');
    }
    return {
      'PAYSTACK_PUBLIC_KEY': paystackPublicKey,
      'PAYSTACK_SECRET_KEY': paystackSecretKey,
    };
  }

  // Generate unique reference
  static String generateReference() {
    return 'GAG_${DateTime.now().millisecondsSinceEpoch}_${UniqueKey().hashCode}';
  }

  // Initialize transaction (server-side) - UPDATED WITH CORRECT URL
  static Future<Map<String, dynamic>> initializeTransaction({
    required BuildContext context,
    required double amount,
    required String reference,
    required String packageId,
    required String packageName,
    required String listingId,
    required String listingName,
    required int durationDays,
    Map<String, dynamic>? additionalMetadata,
  }) async {
    // CORRECT PAYSTACK API ENDPOINT
    final uri = Uri.parse('$_paystackBaseUrl/transaction/initialize');
    
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;
      
      if (user == null) {
        throw Exception('User must be logged in to make payments');
      }

      // Get user metadata - AWAIT THIS FUTURE
      final userMetadata = await _getUserMetadata(context);

      // Build complete metadata
      final metadata = {
        ...userMetadata,
        'transaction_type': 'listing_promotion',
        'package_id': packageId,
        'package_name': packageName,
        'listing_id': listingId,
        'listing_name': listingName,
        'duration_days': durationDays,
        'promotion_timestamp': DateTime.now().toIso8601String(),
        if (additionalMetadata != null) ...additionalMetadata,
      };

      logger.i('Initializing transaction for ${user.email}, amount: $amount');

      final response = await http.post(
        uri,
        headers: {
          'Authorization': 'Bearer ${getPaystackKeys['PAYSTACK_SECRET_KEY']}',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': user.email,
          'amount': (amount * 100).toInt(), // Convert to kobo
          'reference': reference,
          'metadata': metadata,
          'callback_url': 'https://gagcars.com/payment-callback', // Your website callback
          'channels': ['card', 'bank', 'mobile_money'],
        }),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        logger.i('Transaction initialized successfully');
        return result;
      } else {
        logger.e('Failed to initialize transaction: ${response.statusCode}');
        throw Exception('Failed to initialize transaction: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error initializing transaction: $e');
      rethrow;
    }
  }

  // Verify transaction - UPDATED WITH CORRECT URL
// Verify transaction - UPDATED WITH CORRECT URL
static Future<Map<String, dynamic>> verifyAndActivatePromotion({
  required String reference,
  required String listingId,
  required String packageId,
  required String packageName,
  required double amount,
  required int durationDays,
}) async {
  try {
    logger.i('Verifying transaction: $reference');

    // CORRECT PAYSTACK VERIFICATION ENDPOINT
    final verificationUri = Uri.parse('$_paystackBaseUrl/transaction/verify/$reference');
    
    final verificationResponse = await http.get(
      verificationUri,
      headers: {
        'Authorization': 'Bearer ${getPaystackKeys['PAYSTACK_SECRET_KEY']}',
      },
    );

    if (verificationResponse.statusCode == 200) {
      final verificationResult = json.decode(verificationResponse.body);
      
      if (verificationResult['data']['status'] == 'success') {
        logger.i('Payment verified successfully');
        
        try {
          // Activate promotion on your backend
          final dates = PromotionService.calculatePromotionDates(durationDays);
          
          logger.i('Attempting to activate promotion for item: $listingId');
          
          final promotionResult = await PromotionService.activatePromotion(
            itemId: listingId,
            startAt: dates['start_at']!,
            endAt: dates['end_at']!,
            status: 'promoted',
          );

          // DEBUG: Log the complete promotion result
          logger.i('Promotion service raw result: ${promotionResult.toString()}');
          
          // Check if promotion activation was successful
          // Based on your previous logs, successful response contains "Successfully Create Resource"
          final String? message = promotionResult['message']?.toString();
          final bool isPromotionSuccessful = message != null && 
              (message.toLowerCase().contains('success') || 
               message.contains('Successfully Create Resource'));

          if (isPromotionSuccessful) {
            logger.i('Promotion activated successfully');
            return {
              'success': true,
              'message': 'Payment successful and promotion activated',
              'transaction_data': verificationResult['data'],
            };
          } else {
            logger.w('Promotion activation may have failed. Message: $message');
            // Still return success since payment was successful
            return {
              'success': true,
              'message': 'Payment successful. Promotion status: $message',
              'transaction_data': verificationResult['data'],
            };
          }
        } catch (promotionError) {
          logger.e('Error during promotion activation: $promotionError');
          // Payment was successful, but promotion failed - still return success
          return {
            'success': true,
            'message': 'Payment successful but promotion activation encountered an issue',
            'transaction_data': verificationResult['data'],
          };
        }
      } else {
        logger.w('Payment verification failed with status: ${verificationResult['data']['status']}');
        return {
          'success': false,
          'message': 'Payment verification failed: ${verificationResult['data']['status']}',
          'transaction_data': verificationResult['data'],
        };
      }
    } else {
      logger.e('Paystack verification API error: ${verificationResponse.statusCode}');
      throw Exception('Failed to verify transaction: ${verificationResponse.statusCode}');
    }
  } catch (e) {
    logger.e('Error in verifyAndActivatePromotion: $e');
    // Re-throw to let the caller handle it
    rethrow;
  }
}

  // Get user metadata from UserProvider - FIXED THE AWAIT ISSUE
  static Future<Map<String, dynamic>> _getUserMetadata(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;
    
    if (user == null) {
      throw Exception('No user logged in');
    }

    // AWAIT BOTH FUTURES TO GET ACTUAL MAP VALUES, NOT FUTURES
    final deviceInfo = await DeviceInfoUtils.getDeviceInfo();
    final appInfo = await DeviceInfoUtils.getAppInfo();

    return {
      'user_id': user.email,
      'user_name': user.name,
      'user_email': user.email,
      'user_phone': user.phoneNumber,
      'is_paid_seller': user.paidSeller ?? false,
      'user_country_id': user.countryId,
      'user_state_id': user.stateId,
      'profile_image': user.profileImage,
      'email_verified': user.emailVerifiedAt != null,
      'registration_date': user.createdAt?.toIso8601String(),
      'device_info': deviceInfo, // Now this is a Map, not a Future
      'app_info': appInfo, // Now this is a Map, not a Future
      'platform': Platform.operatingSystem,
      'platform_version': Platform.operatingSystemVersion,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }
}
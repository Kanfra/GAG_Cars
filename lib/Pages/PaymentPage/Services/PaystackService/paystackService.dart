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

  static const String _paystackBaseUrl = 'https://api.paystack.co';

  static Map<String, dynamic> get getPaystackKeys {
    try {
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
    } catch (e) {
      logger.e('❌ Error getting Paystack keys: $e');
      rethrow;
    }
  }

  static String generateReference() {
    return 'GAG_${DateTime.now().millisecondsSinceEpoch}_${UniqueKey().hashCode}';
  }

  static Future<Map<String, dynamic>> initializeTransaction({
    required BuildContext context,
    required num amount,
    required String reference,
    required String packageId,
    required String packageName,
    required String listingId,
    required String listingName,
    required int durationDays,
    Map<String, dynamic>? additionalMetadata,
  }) async {
    final uri = Uri.parse('$_paystackBaseUrl/transaction/initialize');

    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;

      if (user == null) {
        throw Exception('User must be logged in to make payments');
      }

      final userMetadata = await _getUserMetadata(context);

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

      logger.i('🔄 Initializing transaction for ${user.email}');
      logger.i('💰 Amount in kobo: $amount');
      logger.i('🔢 Reference: $reference');

      final paystackKeys = getPaystackKeys;
      final secretKey = paystackKeys['PAYSTACK_SECRET_KEY'];

      final requestBody = {
        'email': user.email,
        'amount': (amount * 100).toInt(),
        'reference': reference,
        'metadata': metadata,
        // REMOVED callback_url to avoid 404 errors
        'channels': ['card', 'bank', 'mobile_money'],
      };

      final response = await http.post(
        uri,
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      logger.i('📡 Paystack response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        logger.i('✅ Transaction initialized successfully');
        return result;
      } else {
        logger.e('❌ Failed to initialize transaction: ${response.statusCode}');
        throw Exception(
          'Failed to initialize transaction: ${response.statusCode}',
        );
      }
    } catch (e) {
      logger.e('💥 Error initializing transaction: $e');
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> verifyTransaction({
    required String reference,
  }) async {
    try {
      logger.i('🔍 Verifying transaction: $reference');

      final verificationUri = Uri.parse(
        '$_paystackBaseUrl/transaction/verify/$reference',
      );

      final paystackKeys = getPaystackKeys;
      final secretKey = paystackKeys['PAYSTACK_SECRET_KEY'];

      logger.i('🌐 Calling Paystack verification API: $verificationUri');

      final verificationResponse = await http.get(
        verificationUri,
        headers: {'Authorization': 'Bearer $secretKey'},
      );

      logger.i(
        '📡 Paystack response status: ${verificationResponse.statusCode}',
      );
      logger.i(
        '📦 Paystack response body: ${verificationResponse.body}',
      ); // ← ADD THIS

      if (verificationResponse.statusCode == 200) {
        final verificationResult = json.decode(verificationResponse.body);

        logger.i('📊 Paystack response data: ${verificationResult['data']}');

        if (verificationResult['data'] == null) {
          logger.e('❌ Paystack response missing data field');
          return {
            'status': false,
            'message': 'Invalid response from Paystack',
            'data': null,
          };
        }

        final transactionStatus = verificationResult['data']['status'];
        logger.i('🎯 Transaction status: $transactionStatus');

        // 🛠️ BROADEN SUCCESS CRITERIA
        final successStatuses = [
          'success',
          'successful',
          'completed',
          'approved',
        ];
        if (successStatuses.contains(
          transactionStatus?.toString().toLowerCase(),
        )) {
          logger.i('✅ Payment verified successfully by Paystack');
          return {
            'status': true,
            'message': 'Payment verified successfully',
            'data': verificationResult['data'],
          };
        } else {
          logger.w(
            '⚠️ Payment verification failed. Status: $transactionStatus',
          );
          return {
            'status': false,
            'message':
                'Payment verification failed. Status: $transactionStatus',
            'data': verificationResult['data'],
          };
        }
      } else if (verificationResponse.statusCode == 404) {
        logger.e('❌ Transaction not found (404): $reference');
        return {
          'status': false,
          'message':
              'Transaction not found. Payment may not have been completed.',
          'data': null,
        };
      } else {
        logger.e('❌ Paystack API error: ${verificationResponse.statusCode}');
        return {
          'status': false,
          'message': 'Paystack API error: ${verificationResponse.statusCode}',
          'data': null,
        };
      }
    } catch (e) {
      logger.e('💥 Error in verifyTransaction: $e');
      return {
        'status': false,
        'message': 'Payment verification error: ${e.toString()}',
        'data': null,
      };
    }
  }

  static Future<Map<String, dynamic>> verifyAndActivatePromotion({
    required String reference,
    required String listingId,
    required String packageId,
    required String packageName,
    required num amount,
    required int durationDays,
  }) async {
    try {
      logger.i('🔍 Verifying transaction: $reference');

      final verificationUri = Uri.parse(
        '$_paystackBaseUrl/transaction/verify/$reference',
      );

      final paystackKeys = getPaystackKeys;
      final secretKey = paystackKeys['PAYSTACK_SECRET_KEY'];

      logger.i('🌐 Calling Paystack verification API: $verificationUri');

      final verificationResponse = await http.get(
        verificationUri,
        headers: {'Authorization': 'Bearer $secretKey'},
      );

      logger.i(
        '📡 Paystack response status: ${verificationResponse.statusCode}',
      );

      if (verificationResponse.statusCode == 200) {
        final verificationResult = json.decode(verificationResponse.body);

        logger.i(
          '📊 Paystack response data: ${verificationResult['data']?['status']}',
        );

        if (verificationResult['data'] == null) {
          logger.e('❌ Paystack response missing data field');
          return {
            'success': false,
            'message': 'Invalid response from Paystack',
            'transaction_data': null,
          };
        }

        if (verificationResult['data']['status'] == 'success') {
          logger.i('✅ Payment verified successfully by Paystack');

          try {
            final dates = PromotionService.calculatePromotionDates(
              durationDays,
            );

            logger.i('🚀 Activating promotion for item: $listingId');

            final promotionResult = await PromotionService.activatePromotion(
              itemId: listingId,
              startAt: dates['start_at']!,
              endAt: dates['end_at']!,
              status: 'promoted',
            );

            final String? message = promotionResult['message']?.toString();
            logger.i('📋 Promotion service message: $message');

            final bool isPromotionSuccessful =
                message != null &&
                (message.toLowerCase().contains('success') ||
                    message.contains('Successfully Create Resource'));

            if (isPromotionSuccessful) {
              logger.i('🎉 Promotion activated successfully');
              return {
                'success': true,
                'message': 'Payment successful and promotion activated',
                'transaction_data': verificationResult['data'],
              };
            } else {
              logger.w('⚠️ Promotion activation failed. Message: $message');
              return {
                'success': false,
                'message': 'Payment successful but promotion failed: $message',
                'transaction_data': verificationResult['data'],
              };
            }
          } catch (promotionError) {
            logger.e('❌ Error during promotion activation: $promotionError');
            return {
              'success': false,
              'message': 'Payment verified but promotion activation failed',
              'transaction_data': verificationResult['data'],
            };
          }
        } else {
          logger.w(
            '⚠️ Payment verification failed: ${verificationResult['data']['status']}',
          );
          return {
            'success': false,
            'message':
                'Payment verification failed: ${verificationResult['data']['status']}',
            'transaction_data': verificationResult['data'],
          };
        }
      } else if (verificationResponse.statusCode == 404) {
        logger.e('❌ Transaction not found (404): $reference');
        return {
          'success': false,
          'message':
              'Transaction not found. Payment may not have been completed.',
          'transaction_data': null,
        };
      } else {
        logger.e('❌ Paystack API error: ${verificationResponse.statusCode}');
        return {
          'success': false,
          'message': 'Paystack API error: ${verificationResponse.statusCode}',
          'transaction_data': null,
        };
      }
    } catch (e) {
      logger.e('💥 Error in verifyAndActivatePromotion: $e');
      return {
        'success': false,
        'message': 'Payment verification error: ${e.toString()}',
        'transaction_data': null,
      };
    }
  }

  static Future<Map<String, dynamic>> _getUserMetadata(
    BuildContext context,
  ) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;

      if (user == null) {
        throw Exception('No user logged in');
      }

      final deviceInfo = await DeviceInfoUtils.getDeviceInfo();
      final appInfo = await DeviceInfoUtils.getAppInfo();

      return {
        'user_id': user.email,
        'user_name': user.name ?? 'Unknown',
        'user_email': user.email ?? 'Unknown',
        'user_phone': user.phoneNumber ?? 'Unknown',
        'is_paid_seller': user.paidSeller ?? false,
        'user_country_id': user.countryId ?? 0,
        'user_state_id': user.stateId ?? 0,
        'profile_image': user.profileImage ?? 'Unknown',
        'email_verified': user.emailVerifiedAt != null,
        'registration_date':
            user.createdAt?.toIso8601String() ??
            DateTime.now().toIso8601String(),
        'device_info': deviceInfo,
        'app_info': appInfo,
        'platform': Platform.operatingSystem,
        'platform_version': Platform.operatingSystemVersion,
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      logger.e('❌ Error getting user metadata: $e');
      rethrow;
    }
  }
}

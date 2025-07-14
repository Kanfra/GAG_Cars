import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/auth_response_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/user_model.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';

class AuthService {
  static String get _tokenKey => dotenv.get('TOKEN_KEY');
  static String get _userKey => dotenv.get("USER_KEY");

  static final _storage = FlutterSecureStorage();

  // Get base URL with error handling
  static String get baseApiUrl {
    try {
      return dotenv.get('BASE_API_URL');
    } catch (e) {
      throw Exception('BASE_API_URL not found in .env file');
    }
  }

  // Get device information
  static Future<String> _getDeviceName() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return '${androidInfo.manufacturer} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return '${iosInfo.utsname.machine} (iOS ${iosInfo.systemVersion})';
      }
      return 'Unknown Device';
    } catch (e) {
      return 'Unknown Device';
    }
  }

  
  // get stored token
  static Future<String?> getToken() async {
    final logger = Logger();
    try{
      return await _storage.read(key: _tokenKey);
    } catch(e){
      logger.e("Error reading token: $e");
      return null;
    }
  }

  // save token securely
  static Future<void> saveToken(String token) async {
    final logger = Logger();
    try{
      await _storage.write(key: _tokenKey, value: token);
    } catch(e){
      logger.e("Error saving token: $e");
      throw Exception("Failed to save token");
    }
  }

  // delete token (logout)
  static Future<void> deleteToken() async {
    final logger = Logger();
    try {
      await _storage.delete(key: _tokenKey);
    } catch (e) {
      logger.e('Error deleting token: $e');
      throw Exception('Failed to delete token');
    }
  }

  // check if token is valid and not expired
  static bool _isTokenValid(String token){
    final logger = Logger();
    try{
      if(JwtDecoder.isExpired(token)){
        logger.e("Token is expired");
        return false;
      }
      return true;
    } catch(e){
      logger.e("Token validation error: $e");
      return false;
    }
  }
  static Future<bool> isAuthenticated() async {
    final logger = Logger();
    try{
      final token = await getToken();
      if(token == null) return false;
      return _isTokenValid(token);
    } catch(e){
      // if any error occurs, treat as unauthenticated
      logger.e("Auth check error: $e");
      return false;
    }
  }

  //  // Get token expiration date
  // static DateTime? getTokenExpiration(String token) {
  //   try {
  //     return JwtDecoder.getExpirationDate(token);
  //   } catch (e) {
  //     print('Error getting token expiration: $e');
  //     return null;
  //   }
  // }

  // // Get user ID from token
  // static String? getUserId(String token) {
  //   try {
  //     final payload = JwtDecoder.decode(token);
  //     return payload['sub'] ?? payload['userId'];
  //   } catch (e) {
  //     print('Error getting user ID from token: $e');
  //     return null;
  //   }
  // }

  // Sign up with Phone
  static Future<AuthResponseModel> signInWithPhone({
    required String phone
  }) async {
    final logger = Logger();
    const endpoint = '/otp/send';
    final url = Uri.parse('$baseApiUrl$endpoint');
    try{
      // take the body
      final body = jsonEncode({
        "phone": phone,
      });
      // check url valid by print out in terminal
      logger.i('Sending request to $url');
      // check body valid by print out in terminal
      logger.t('Request body: $body');
      // make the api request
      final response = await http.post(
        url,
        headers: {"Content-Type":"application/json"},
        body: body
      ).timeout(const Duration(seconds: 10)); // add timeout

      logger.i("Response status: ${response.statusCode}");
      logger.t("Response body: ${response.body}");

      // check response status
      if(response.statusCode == 201 || response.statusCode == 200){
        return AuthResponseModel.fromJson(jsonDecode(response.body));
      }else{
        final errorData = jsonDecode(response.body);
        throw Exception(errorData["message"]) ?? "Failed to sign up.";
      }
    }on SocketException{
      logger.e("Network unreachable");
      throw Exception("No internet connection.");
    }on TimeoutException{
      logger.e("Request timed out");
      throw Exception("Server timeout. Please try again.");
    }
    on http.ClientException catch (e) {
      logger.e("HTTP client error: ${e.message}");
      throw Exception("Network request failed.");
    } on FormatException catch (e) {
      logger.e("Malformed response: $e");
      throw Exception("Invalid server response.");
    } catch (e) {
      logger.e('Unexpected error: $e');
      throw Exception("Signup failed. Please try again.");
    }
  }

  // Sign up with email
  static Future<AuthResponseModel?> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    final logger = Logger();
    const endpoint = '/sanctum/register'; 
    final url = Uri.parse('$baseApiUrl$endpoint');
    final deviceName = await _getDeviceName();

    try {
      // Request body - updated to match your model
      final body = jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "device_name": deviceName, // Added device name
      });

      logger.i('Sending request to $url');
      logger.t('Request body: $body'); // verbose log for sensitive data

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: body,
      ).timeout(const Duration(seconds: 10));

      logger.i('Response status: ${response.statusCode}');
      logger.t('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final authResponse = AuthResponseModel.fromJson(responseData);
        logger.i("Parsed response: $authResponse");
        return authResponse;
      } else {
        final errorData = jsonDecode(response.body);
        logger.e("Failed to sign up: ${response.statusCode}, response body: ${response.body}");
        throw Exception(
          errorData['message'] ?? 'Failed to sign up: ${response.statusCode}',
        );
      }
    } on http.ClientException catch (e) {
      logger.e('Network error: $e');
      throw Exception('Network error: ${e.message}');
    } on FormatException catch (e) {
      logger.e('JSON parsing error: $e');
      throw Exception('Invalid server response');
    } catch (e) {
      logger.e('Unexpected error: $e');
      throw Exception('Signup failed: ${e.toString()}');
    }
  }

  // sign in with email
  // auth_service.dart
// Login with Email
  static Future<AuthResponseModel> logInWithEmail({
    required String email,
    required String password,
  }) async {
    final logger = Logger();
    final deviceName = await _getDeviceName();
    const endpoint = '/sanctum/token'; 
    final url = Uri.parse('$baseApiUrl$endpoint');
    try {
      final body = jsonEncode({
        'email': email,
        'password': password,
        'device_name': deviceName,
      });
      logger.i("body: $body");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 201) {
        final authResponse = AuthResponseModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        );
        
        // Secure storage of token and user data
        await _storage.write(key: _tokenKey, value: authResponse.token);
        await _storage.write(
          key: _userKey, 
          value: jsonEncode(authResponse.user.toJson()),
        );
        
        return authResponse;
      } else {
        final error = jsonDecode(response.body);
        logger.e("Login failed: ${error['message']}");
        throw Exception(error['message'] ?? 'Login failed');
      }
    } catch (e) {
      logger.e("Login failed: $e");
      throw Exception('Login failed: ${e.toString()}');
    }
  }


static Future<bool> sendOtp(
  String phone, 
  String email, 
  // String token
  ) async {
  final logger = Logger();
  const endpoint = '/otp/send'; 
  final url = Uri.parse('$baseApiUrl$endpoint');
  try{
    final body = jsonEncode({
        'phone': phone,
        'email': email
        });
      logger.i("body: $body");
      // logger.i("token: $token");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        logger.i("OTP sent successfully");
        return true;
      } else {
        logger.e("Failed to send OTP: ${response.body}");
        throw Exception("Failed to send OTP: ${response.body}");
        }
  }catch(e){
    logger.e("Error sending OTP: $e");
    throw Exception("Error sending OTP: $e");
  }
}

static Future<AuthResponseModel> verifyOtp({
  required String phone,
  required String otp,
  // required String? token,
}) async {
  final logger = Logger();
  const endpoint = '/otp/verify'; 
  final url = Uri.parse('$baseApiUrl$endpoint');
  const storage = FlutterSecureStorage();
  try{
    final body = jsonEncode({
        'phone': phone ,
        'otp': otp
        });
      logger.i("body: $body");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: body,
      );
      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final token = responseBody['token'];
        final message = responseBody['message'];
        logger.i('test success response: $message');
        // store token securely
        if(token != null){
          await storage.write(key: 'auth_token', value: token);
          logger.i("Auth token stored securely");
        }
        logger.i("OTP verified successfully: ${response.body}");
        return AuthResponseModel.fromJson(responseBody);
      } else {
        logger.e("Failed to verify OTP: ${response.body}");
        throw Exception('Failed to verify OTP: ${response.body}');
      }

  }catch(e){
    logger.e("Error verifying OTP: $e");
    throw Exception("Error verifying OTP: $e");
  }
}
 

// send password reset email
static Future<void> sendPasswordResetEmail({
  required String email,
}) async {
  try{
    await postApiData<void>(
      endpoint: ApiEndpoint.resetPassword,
      body: {
        'email': email
      },
      fromJson: (_){}, // empty function since we don't need return data
    );
  } catch(e){
    rethrow; // let the calling function handle the error
  }
}

// reset password
static Future<void> resetPassword({
  required String token,
  required String email,
  required String newPassword,
}) async {
  try{
    await postApiData(
      endpoint: ApiEndpoint.sendResetPasswordOtp, 
      body: {
        'token': token,
        'email': email,
        'newPassword': newPassword,
      }, 
      fromJson: (_){},  // no return data expected
      );
  }catch(e){
    rethrow; //let the UI handle the error
  }
}
 
  // Get stored user
  // static Future<UserModel?> getCurrentUser() async {
  //   final userJson = await _storage.read(key: _userKey);
  //   return userJson != null 
  //       ? UserModel.fromJson(jsonDecode(userJson))
  //       : null;
  // }

  // Get stored token
  // static Future<String?> getToken() async {
  //   return await _storage.read(key: _tokenKey);
  // }

  // Logout
  // static Future<void> logout() async {
  //   await _storage.delete(key: _tokenKey);
  //   await _storage.delete(key: _userKey);
  // }

// Always verify token exists before use
// Future<String?> getSafeToken() async {
//   final token = await _storage.read(key: _tokenKey);
//   if (token == null) {
//     await _redirectToLogin();
//     return null;
//   }
//   return token;
// }
}
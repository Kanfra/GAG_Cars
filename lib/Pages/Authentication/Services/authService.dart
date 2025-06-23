import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/auth_response_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/user_model.dart';
import 'package:http/http.dart' as http;
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

  // Sign up with email
  static Future<UserModel?> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    String? phoneNumber,
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
        if (phoneNumber != null) "phone": phoneNumber, // Note the 'phone' key
        "device_name": deviceName, // Added device name
      });

      logger.i('Sending request to $url');
      logger.i('Request body: $body');

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: body,
      );

      logger.d('Response status: ${response.statusCode}');
      logger.d('Response body: ${response.body}');

      if (response.statusCode == 201) {
        return UserModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        );
      } else {
        final errorData = jsonDecode(response.body);
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
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
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
        throw Exception(error['message'] ?? 'Login failed');
      }
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
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
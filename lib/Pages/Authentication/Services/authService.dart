import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/auth_response_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/user_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/cloudinaryService.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class AuthService {
  static String get _tokenKey => dotenv.get('TOKEN_KEY');

  static final _storage = FlutterSecureStorage();
  static final Logger _logger = Logger();

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

  // Get stored token
  static Future<String?> getToken() async {
    try {
      return await _storage.read(key: _tokenKey);
    } catch (e) {
      _logger.e("Error reading token: $e");
      return null;
    }
  }

  // Save token securely
  static Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: _tokenKey, value: token);
    } catch (e) {
      _logger.e("Error saving token: $e");
      throw Exception("Failed to save token");
    }
  }

  // Delete token (logout)
  static Future<void> deleteToken() async {
    try {
      await _storage.delete(key: _tokenKey);
    } catch (e) {
      _logger.e('Error deleting token: $e');
      throw Exception('Failed to delete token');
    }
  }

  // Authentication check
  static Future<bool> isAuthenticated(UserProvider userProvider) async {
    final uri = Uri.parse("$baseApiUrl${ApiEndpoint.authenticateUser}");
    try {
      final token = await getToken();
      if (token == null) return false;

      // Make a request to verify token and get user data
      final response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['user'] != null) {
          final authResponse = AuthResponseModel.fromJson(data);
          await userProvider.setUserFromAuth(authResponse);
          _logger.i("Authenticated user: ${data["user"]["email"]}");
          return true;
        }
        return false;
      }
      return false;
    } catch (e) {
      _logger.e("Error during auth check: $e");
      return false;
    }
  }

  // Sign in with Phone
  static Future<AuthResponseModel> signInWithPhone({
    required String phone,
  }) async {
    const endpoint = ApiEndpoint.sendOtp;
    final url = Uri.parse('$baseApiUrl$endpoint');

    try {
      final body = jsonEncode({"phone": phone});

      _logger.i('Sending request to $url');
      _logger.t('Request body: $body');

      final response = await http
          .post(url, headers: {"Content-Type": "application/json"}, body: body)
          .timeout(const Duration(seconds: 10));

      _logger.i("Response status: ${response.statusCode}");
      _logger.t("Response body: ${response.body}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        return AuthResponseModel.fromJson(jsonDecode(response.body));
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData["message"] ?? "Failed to sign up.");
      }
    } on SocketException {
      _logger.e("Network unreachable");
      throw Exception("No internet connection.");
    } on TimeoutException {
      _logger.e("Request timed out");
      throw Exception("Server timeout. Please try again.");
    } on http.ClientException catch (e) {
      _logger.e("HTTP client error: ${e.message}");
      throw Exception("Network request failed.");
    } on FormatException catch (e) {
      _logger.e("Malformed response: $e");
      throw Exception("Invalid server response.");
    } catch (e) {
      _logger.e('Unexpected error: $e');
      throw Exception("Signup failed. Please try again.");
    }
  }

  // Sign up with Email
  static Future<AuthResponseModel?> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    required String phone,
    required int countryId,
  }) async {
    const endpoint = '/sanctum/register';
    final url = Uri.parse('$baseApiUrl$endpoint');
    final deviceName = await _getDeviceName();

    try {
      final body = jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "country_id": countryId,
        "device_name": deviceName,
      });

      _logger.i('Sending request to $url');
      _logger.t('Request body: $body');

      final response = await http
          .post(
            url,
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
            body: body,
          )
          .timeout(const Duration(seconds: 10));

      _logger.i('Response status: ${response.statusCode}');
      _logger.t('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final authResponse = AuthResponseModel.fromJson(responseData);
        _logger.i("Parsed response: $authResponse");
        return authResponse;
      } else {
        final errorData = jsonDecode(response.body);
        _logger.e(
          "Failed to sign up: ${response.statusCode}, response body: ${response.body}",
        );
        throw Exception(
          errorData['message'] ?? 'Failed to sign up: ${response.statusCode}',
        );
      }
    } on http.ClientException catch (e) {
      _logger.e('Network error: $e');
      throw Exception('Network error: ${e.message}');
    } on FormatException catch (e) {
      _logger.e('JSON parsing error: $e');
      throw Exception('Invalid server response');
    } catch (e) {
      _logger.e('Unexpected error: $e');
      throw Exception('Signup failed: ${e.toString()}');
    }
  }

  // Sign in with Email - UPDATED to accept UserProvider
  static Future<void> logInWithEmail({
    required String email,
    required String password,
    required UserProvider userProvider, // Added required parameter
  }) async {
    final deviceName = await _getDeviceName();
    final url = Uri.parse('$baseApiUrl${ApiEndpoint.logInWithEmail}');

    _logger.i('📧 Email: $email');
    _logger.i('📱 Device name: $deviceName');
    _logger.i('🔗 API URL: $url');

    try {
      final body = jsonEncode({
        'email': email,
        'password': password,
        'device_name': deviceName,
      });

      _logger.i('📦 Request body: $body');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: body,
      );

      _logger.i('📊 Status Code: ${response.statusCode}');
      _logger.i('📝 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final token = responseBody['token'];
        final message = responseBody['message'];

        if (token == null) {
          _logger.e('Token is null in response');
          throw Exception('Authentication token not received from server');
        }

        _logger.w('Success for token: $token and message: $message');

        final authResponse = AuthResponseModel.fromJson(responseBody);

        // Secure storage of token
        await saveToken(authResponse.token!);
        _logger.i('💾 Token stored securely');

        // ✅ CRITICAL FIX: Use the passed UserProvider instance
        await userProvider.setUserFromAuth(authResponse);
        _logger.i('✅ User data updated in provider successfully');
      } else {
        final errorData = jsonDecode(response.body);
        _logger.e('🔍 Validation errors: $errorData');
        final errorMessage = errorData['message'] ?? 'Validation failed';
        throw Exception(errorMessage);
      }
    } on SocketException catch (e) {
      _logger.e('🌐 Network error: $e');
      throw Exception(
        'No internet connection. Please check your network and try again.',
      );
    } on TimeoutException catch (e) {
      _logger.e('⏰ Request timeout: $e');
      throw Exception('Request timeout. Please try again.');
    } on FormatException catch (e) {
      _logger.e('📄 JSON parsing error: $e');
      throw Exception('Invalid server response format. Please try again.');
    } on http.ClientException catch (e) {
      _logger.e('🚫 HTTP client error: $e');
      throw Exception('Network request failed. Please check your connection.');
    } catch (e) {
      _logger.e('💥 Unexpected login error: $e');
      _logger.e('📝 Stack trace: ${e.toString()}');
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  // Send OTP
  static Future<bool> sendOtp(String phone, String email) async {
    const endpoint = ApiEndpoint.sendOtp;
    final url = Uri.parse('$baseApiUrl$endpoint');

    try {
      final body = jsonEncode({'phone': phone, 'email': email});

      _logger.i("body: $body");

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        _logger.i("OTP sent successfully");
        return true;
      } else {
        _logger.e("Failed to send OTP: ${response.body}");
        throw Exception("Failed to send OTP: ${response.body}");
      }
    } catch (e) {
      _logger.e("Error sending OTP: $e");
      throw Exception("Error sending OTP: $e");
    }
  }

  // Verify OTP
  static Future<void> verifyOtp({
    required String phone,
    required String otp,
    required UserProvider userProvider,
  }) async {
    const endpoint = ApiEndpoint.verifyOtp;
    final url = Uri.parse('$baseApiUrl$endpoint');

    try {
      final body = jsonEncode({'phone': phone, 'otp': otp});

      _logger.i("body: $body");

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final token = responseBody['token'];
        final message = responseBody['message'];

        _logger.w(
          "Response body for successful verification of otp: $responseBody",
        );
        _logger.i('test success response: $message and token: $token');

        // Store token securely
        if (token != null) {
          await saveToken(token);
          _logger.i("Auth token stored securely");
        }

        // Store data in provider
        final authResponse = AuthResponseModel.fromJson(responseBody);
        await userProvider.setUserFromAuth(authResponse);
        _logger.i("OTP verified successfully: ${response.body}");
      } else {
        _logger.e("Failed to verify OTP: ${response.body}");
        throw Exception('Failed to verify OTP: ${response.body}');
      }
    } catch (e) {
      _logger.e("Error verifying OTP: $e");
      throw Exception("Error verifying OTP: $e");
    }
  }

  // Send password reset email
  static Future<void> sendPasswordResetEmail({
    required String phone,
    required String email,
  }) async {
    try {
      await postApiData<void>(
        endpoint: ApiEndpoint.sendResetPasswordOtp,
        body: {"phone": phone, "email": email},
        fromJson: (_) {},
      );
    } catch (e) {
      _logger.e("Error sending password reset email: $e");
      rethrow;
    }
  }

  // Reset password
  static Future<void> resetPassword({
    required String phone,
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      final token = await getToken();
      if (token == null) {
        throw Exception("User not authenticated");
      }

      _logger.i("token: $token");

      await postApiData(
        endpoint: ApiEndpoint.resetPassword,
        body: {
          'phone': phone,
          'email': email,
          'otp': otp,
          'password': newPassword,
        },
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        fromJson: (_) {},
      );
    } catch (e) {
      rethrow;
    }
  }

  // Get user profile
  static Future<Map<String, dynamic>> getUserProfile() async {
    final uri = Uri.parse("$baseApiUrl${ApiEndpoint.authenticateUser}");

    try {
      final token = await getToken();
      if (token == null) {
        throw Exception("User not authenticated");
      }

      final response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _logger.i("User profile fetched successfully: ${response.body}");
        return responseBody;
      } else {
        _logger.e("Failed to fetch user profile: ${response.body}");
        throw Exception("Failed to fetch user profile: ${response.body}");
      }
    } catch (e) {
      _logger.e("Error fetching user profile: $e");
      throw Exception("Error fetching user profile: $e");
    }
  }

  // Get AuthResponseModel (which includes verified status)
  static Future<AuthResponseModel> getAuthUserProfile() async {
    final response = await getUserProfile();
    return AuthResponseModel.fromJson(response);
  }

  // Logout
  static Future<Map<String, dynamic>> logoutUser() async {
    final uri = Uri.parse("$baseApiUrl${ApiEndpoint.logoutUser}");

    try {
      final token = await getToken();
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        try {
          await deleteToken();
          _logger.i("Token deleted successfully");
          return {
            "success": true,
            "message":
                json.decode(response.body)['message'] ??
                'Logged out successfully',
          };
        } catch (e) {
          _logger.e("Logout API succeeded but token deletion failed: $e");
          return {
            "success": false,
            "message": "Logged out but failed to clear local data",
          };
        }
      } else if (response.statusCode == 401) {
        await deleteToken().catchError((e) {
          _logger.e("Failed to delete invalid token: $e");
        });
        return {
          "success": false,
          "message": json.decode(response.body)['message'] ?? 'Session expired',
        };
      } else {
        return {"success": false, "message": "Server error during logout"};
      }
    } catch (e) {
      _logger.e("Logout process failed: $e");
      return {"success": false, "message": "Network error: ${e.toString()}"};
    }
  }

  // Update user profile
  static Future<UserModel> updateUserProfile({
    required UserModel currentUser,
    File? profileImage,
    String? userName,
    String? phoneNumber,
    String? email,
    int? countryId,
  }) async {
    const endpoint = ApiEndpoint.updateProfile;
    final url = Uri.parse('$baseApiUrl$endpoint');

    try {
      // Upload to Cloudinary if new image exists
      String? profileImageUrl;
      if (profileImage != null) {
        final oldImageUrl = currentUser.profileImage;
        profileImageUrl = await CloudinaryService.uploadImage(
          profileImage,
          oldImageUrl: oldImageUrl,
        );
      }

      // Get auth token
      final token = await getToken();
      _logger.w('Token upon update user profile: $token');

      if (token == null) {
        throw Exception('User not authenticated');
      }

      // Prepare request body
      final Map<String, dynamic> requestBody = {};
      if (userName != null) requestBody['name'] = userName;
      if (phoneNumber != null) requestBody['phone'] = phoneNumber;
      if (email != null) requestBody['email'] = email;

      // Preserve existing profile image if no new image is uploaded
      if (profileImageUrl != null) {
        requestBody['profile_photo'] = profileImageUrl;
      } else {
        requestBody['profile_photo'] = currentUser.profileImage;
      }

      if (countryId != null) requestBody["country_id"] = countryId;

      _logger.w("requestBody before api request: $requestBody");

      // Make API request
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      // Handle response
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        _logger.i('Response body after update user profile: ${response.body}');
        return UserModel.fromJson(responseData['user']);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['message'] ?? 'Failed to update profile');
      }
    } catch (e) {
      _logger.e('Profile update failed: $e');
      rethrow;
    }
  }

  // Delete user
  static Future<bool> deleteUser() async {
    try {
      final token = await getToken();
      final uri = Uri.parse("$baseApiUrl${ApiEndpoint.deleteUser}");

      final response = await http.delete(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        _logger.i("User deleted successfully");
        return true;
      } else if (response.statusCode == 401) {
        return false;
      } else {
        throw HttpException(
          'Failed to delete user. Status code: ${response.statusCode}',
        );
      }
    } on http.ClientException catch (e) {
      _logger.e('Network error: ${e.message}');
      throw HttpException('Network error: ${e.message}');
    } on HttpException {
      rethrow;
    } catch (e) {
      _logger.e('Unexpected error: ${e.toString()}');
      throw HttpException('Unexpected error: ${e.toString()}');
    }
  }
}

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
      await _storage.delete(key: "auth_token");
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


  static Future<bool> isAuthenticated(UserProvider userProvider) async {
    final logger = Logger();
    final uri = Uri.parse("$baseApiUrl${ApiEndpoint.authenticateUser}");
    try{
      final token = await getToken();
      if(token == null) return false;

      // make a request
      final response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        }
      );

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        if(data['user'] != null){
          final authResponse = AuthResponseModel.fromJson(data);
          userProvider.setUser(authResponse.user);
          logger.i("Authenticated user: ${data["user"]["email"]}");
          return true;
        }
        return false;
      }
      return false;
    } catch(e){
      // if any error occurs, treat as unauthenticated
      logger.e("Error during auth check: $e");
      return false;
    }
  }


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

  // Sign up with Phone - done
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

// send otp - done
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
  required UserProvider userProvider,
  // required String? token,
}) async {
  final logger = Logger();
  const endpoint = ApiEndpoint.verifyOtp; 
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
        logger.i('test success response: $message and token: $token');

        final authResponse = AuthResponseModel.fromJson(responseBody);
        await userProvider.setUser(authResponse.user);
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
      endpoint: ApiEndpoint.sendResetPasswordOtp,
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
 
static Future<Map<String, dynamic>> getUserProfile() async {
  final logger = Logger();
  final uri = Uri.parse("$baseApiUrl${ApiEndpoint.authenticateUser}");
  try{
    final token = await AuthService.getToken();
    if (token == null) {
      throw Exception("User not authenticated");
    }
    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      }
    );
    final responseBody = jsonDecode(response.body);
    if(response.statusCode == 200){
      logger.i("User profile fetched successfully: ${response.body}");
      return responseBody;
    }
    else {
      logger.e("Failed to fetch user profile: ${response.body}");
      throw Exception("Failed to fetch user profile: ${response.body}");
    }
      } catch(e){
        logger.e("Error fetching user profile: $e");
        throw Exception("Error fetching user profile: $e");
      }
  } 

  // Add this method to get AuthResponseModel (which includes verified status)
static Future<AuthResponseModel> getAuthUserProfile() async {
  final response = await getUserProfile();
  return AuthResponseModel.fromJson(response);
}



  // Get stored token
  // static Future<String?> getToken() async {
  //   return await _storage.read(key: _tokenKey);
  // }

  // Logout- done
  static Future<Map<String, dynamic>> logoutUser() async {
    final logger = Logger();
    final uri = Uri.parse("$baseApiUrl${ApiEndpoint.logoutUser}");
    try{
      // get token
      final token = await _storage.read(key: 'auth_token');
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }
      );
      if(response.statusCode == 200){
        try{
          // delete token from storage
          await deleteToken();
          logger.i("Token deleted successfully");
          return {
          "success": true,
          "message": json.decode(response.body)['message'] ?? 'Logged out successfully'
        };
        }catch(e){
          logger.e("Logout API succeeded but token deletion failed: $e");
          return {
            "success": false,
            "message": "Logged out but failed to clear local data"
          };
        } 
      } else if(response.statusCode == 401){
        // if token is invalid, still attempt to delete it locally
        await deleteToken().catchError((e){
          logger.e("Failed to delete invalid token: $e");
        });
        return {
          "success": false,
          "message": json.decode(response.body)['message'] ?? 'Session expired'
        };
      } else {
        return {
          "success": false,
          "message": "Server error during logout",
        };
      }
    }catch(e){
      logger.e("Logout process failed: $e");
      return {
        "succes": false,
        "message": "Network error: ${e.toString()}"
      };
    }
  }


  // upload image to cloudinary
  
  // update user profile
  static Future<UserModel> updateUserProfile({
    required UserModel currentUser,
    File? profileImage,
    String? userName,
    String? phoneNumber,
    String? email,
  }) async {
    final logger = Logger();
    const endpoint = ApiEndpoint.updateProfile; 
    final url = Uri.parse('$baseApiUrl$endpoint');
    const storage = FlutterSecureStorage();
    try {
      // first upload the cloudinary if new image exist
      String? profileImageUrl;
      if(profileImage != null){
        final oldImageUrl = currentUser.profileImage;
        
        profileImageUrl = await CloudinaryService.uploadImage(
          profileImage,
          oldImageUrl: oldImageUrl,
        ); 
      }
      // get auth token
      final token = await _storage.read(key: 'auth_token');
      logger.w('Token upon update user profile: $token');
      if(token == null){
        throw Exception('User not authenticated');
      }

      // prepare request body
      final Map<String, dynamic> requestBody = {};
      if(userName != null) requestBody['name'] = userName;
      if(phoneNumber != null) requestBody['phone'] = phoneNumber;
      if(email != null) requestBody['email'] = email;
      if(profileImageUrl != null) requestBody['profile_photo'] = profileImageUrl;
      // request body before api request
      logger.w("requestBody before api request: $requestBody");
      // make api request
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(requestBody),
      );

      // handle response
      if(response.statusCode == 200){
        final responseData = jsonDecode(response.body);
        logger.i('Response body after update user profile: ${response.body}');
        return UserModel.fromJson(responseData['user']);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['message'] ?? 'Failed to update profile');
      }
    } catch(e){
      logger.e('Profile update failed: $e');
      rethrow;
    }
  }


}

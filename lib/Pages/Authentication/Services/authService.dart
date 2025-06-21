import 'dart:convert';

import 'package:gag_cars_frontend/Pages/Authentication/Models/authWithEmailModel.dart';
import 'package:http/http.dart' as http;

class AuthService{
  static const String _baseUrl = "";
  // sign up with email
  static Future<AuthWithEmailModel?> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    String? phoneNumber,
  }) async {
    try{
      final response = await http.post(
        Uri.parse(""),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "phoneNumber": phoneNumber,
        })
      );
      if(response.statusCode == 201){
        // parse response into AuthWithEmailModel
        return AuthWithEmailModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception("Failed to sign up: ${response.body}");
      }
    }catch(e){
      throw Exception("Error during signup: $e");
    }
  }
}
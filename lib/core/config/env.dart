import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Future<void> init() async {
    await dotenv.load(fileName: ".env");
  }

  static String get googleApiKey {
    final key = dotenv.get('GOOGLE_API_KEY');
    if (key.isEmpty) throw Exception('Google API key not found');
    return key;
  }
}
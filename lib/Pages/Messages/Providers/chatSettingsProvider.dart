import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatSettingsProvider with ChangeNotifier {
  static const String _bgColorKey = 'chat_bg_color';
  static const String _bgImageKey = 'chat_bg_image';
  static const String _isImageModeKey = 'chat_is_image_mode';

  Color _backgroundColor = Colors.white;
  String? _backgroundImageSource;
  bool _isImageMode = false;

  Color get backgroundColor => _backgroundColor;
  String? get backgroundImageSource => _backgroundImageSource;
  bool get isImageMode => _isImageMode;

  ChatSettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final colorVal = prefs.getInt(_bgColorKey);
    if (colorVal != null) {
      _backgroundColor = Color(colorVal);
    }

    _backgroundImageSource = prefs.getString(_bgImageKey);
    _isImageMode = prefs.getBool(_isImageModeKey) ?? false;

    notifyListeners();
  }

  Future<void> setBackgroundColor(Color color) async {
    _backgroundColor = color;
    _isImageMode = false;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_bgColorKey, color.value);
    await prefs.setBool(_isImageModeKey, false);
  }

  Future<void> setBackgroundImage(String source) async {
    _backgroundImageSource = source;
    _isImageMode = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_bgImageKey, source);
    await prefs.setBool(_isImageModeKey, true);
  }

  Future<void> resetToDefault() async {
    _backgroundColor = Colors.white;
    _isImageMode = false;
    _backgroundImageSource = null;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_bgColorKey);
    await prefs.remove(_bgImageKey);
    await prefs.setBool(_isImageModeKey, false);
  }
}

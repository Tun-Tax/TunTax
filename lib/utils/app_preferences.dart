import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const _isFirstTimeUserKey = 'isFirstTimeUser';

  static Future<bool> getIsFirstTimeUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstTimeUserKey) ?? true; // Default to true if not set
  }

  static Future<void> setIsFirstTimeUser(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstTimeUserKey, value);
  }
}

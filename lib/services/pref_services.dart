import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefServices {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setValue(String key, dynamic value) async {
    if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is int) {
      await _prefs?.setInt(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is double) {
      await _prefs?.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs?.setStringList(key, value);
    } else {
      Get.snackbar('Preferences Error!!!',
          'Send valid value for Store Data In Preferences');
    }
  }

  static String getString(String key) {
    return _prefs!.getString(key) ?? '';
  }

  static int getInteger(String key) {
    return _prefs!.getInt(key) ?? 0;
  }

  static bool getBoolean(String key) {
    return _prefs!.getBool(key) ?? false;
  }

  static double getDouble(String key) {
    return _prefs!.getDouble(key) ?? 0.0;
  }

  static List<String> getStringList(String key) {
    return _prefs!.getStringList(key) ?? [];
  }

  static removeValuePref(String key) {
    _prefs!.clear();
  }

  static deletePref() {
    _prefs!.clear();
  }
}

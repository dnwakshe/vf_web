import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAsync {
  static final SharedPreferencesAsync _instance = SharedPreferencesAsync._internal();

  SharedPreferencesAsync._internal();

  factory SharedPreferencesAsync() {
    return _instance;
  }

  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> setBool(String key, bool value) async {
    final prefs = await _getPrefs();
    return prefs.setBool(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    final prefs = await _getPrefs();
    return prefs.setInt(key, value);
  }

  Future<bool> setString(String key, String value) async {
    final prefs = await _getPrefs();
    return prefs.setString(key, value);
  }

  Future<bool> getBool(String key) async {
    final prefs = await _getPrefs();
    return prefs.getBool(key) ?? false;
  }

  Future<int> getInt(String key) async {
    final prefs = await _getPrefs();
    return prefs.getInt(key) ?? 0;
  }

  Future<String> getString(String key) async {
    final prefs = await _getPrefs();
    return prefs.getString(key) ?? "";
  }

  Future<bool> remove(String key) async {
    final prefs = await _getPrefs();
    return prefs.remove(key);
  }

  Future<bool> clear({Set<String>? allowList}) async {
    final prefs = await _getPrefs();
    if (allowList != null && allowList.isNotEmpty) {
      final keysToRemove = prefs.getKeys().where((key) => !allowList.contains(key)).toList();
      for (String key in keysToRemove) {
        await prefs.remove(key);
      }
      return true;
    } else {
      return prefs.clear();
    }
  }
}

final sharedPreferencesAsync = SharedPreferencesAsync();
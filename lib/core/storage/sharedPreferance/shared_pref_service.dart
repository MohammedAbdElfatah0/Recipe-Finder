import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  SharedPrefService._();

  static final SharedPrefService _instance = SharedPrefService._();

  factory SharedPrefService() => _instance;

  SharedPreferences? _prefs;

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  String? getString(String key) {
    return _prefs?.getString(key);
  }

  Future remove(String key) async {
    await _prefs?.remove(key);
  }

  Future clear() async {
    await _prefs?.clear();
  }
}
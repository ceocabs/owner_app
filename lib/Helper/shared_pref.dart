import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserDefaults {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getKeys().contains(key)) {
      return json.decode(prefs.getString(key) ?? "");
    }
    return "";
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  clearPreference() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

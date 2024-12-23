import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  static intSave({required String key, required int value}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(key, value);
  }

  static intGet({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.reload();
    return prefs.getInt(key);
  }

  static stringSave({required String? key, required String? value}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(key.toString(), value.toString());
  }

  static stringGet({required String? key}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.reload();

    return prefs.getString(key.toString());
  }

  static boolSave({String? key, bool? value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key.toString(), value!);

    debugPrint("Save Bool Key is :${key}Value is: $value");
  }

  static Future boolGet({String? key}) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.reload();

    debugPrint("Get Bool Key is :$key");
    debugPrint("Get Bool Value" + prefs.getBool(key!).toString());

    return prefs.getBool(key.toString());
  }

  static removeSharedPrefKey({required String removeKey}) async {
    final prefs = await SharedPreferences.getInstance();

    final success = await prefs.remove(removeKey);
    debugPrint("Romove key after value" + success.toString());
  }
}
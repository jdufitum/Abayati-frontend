import 'dart:convert';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences sharedPreferences;

  // late final FlutterSecureStorage flutterSecureStorage;

  LocalStorage({
    required this.sharedPreferences,
    // required this.flutterSecureStorage,
  });

  Future<bool> writeBool(String key, bool value) async {
    try {
      return await sharedPreferences.setBool(key, value);
    } catch (_) {
      return value;
    }
  }

  bool? readBool(String key) {
    try {
      return sharedPreferences.getBool(key);
    } catch (_) {
      return null;
    }
  }

  Future<void> writeString({required String key, required String value}) async {
    try {
      await sharedPreferences.setString(key, value);
    } catch (_) {}
  }

  String? readString(String key) {
    try {
      return sharedPreferences.getString(key);
    } catch (_) {
      return null;
    }
  }

  Future<void> writeObject<T extends BaseModel>(
      {required String key, required T value}) async {
    try {
      await sharedPreferences.setString(key, jsonEncode(value.toJson()));
    } catch (_) {}
  }

  // Future<void> writeSecureString(
  //     {required String key, required String value}) async {
  //   try {
  //     await flutterSecureStorage.write(key: key, value: value);
  //   } catch (_) {}
  // }
  //
  // Future<String?> readSecureString(String key) async {
  //   try {
  //     return await flutterSecureStorage.read(key: key);
  //   } catch (_) {
  //     return null;
  //   }
  // }

  Future<void> deleteString(String key) async {
    try {
      await sharedPreferences.remove(key);
    } catch (_) {}
  }

  //
  // Future<void> deleteSecure(String key) async {
  //   try {
  //     await flutterSecureStorage.delete(key: key);
  //   } catch (_) {}
  // }
  //
  // Future<void> writeSecureObject<T extends BaseModel>(
  //     {required String key, required T? value}) async {
  //   try {
  //     await flutterSecureStorage.write(
  //         key: key, value: value == null ? null : jsonEncode(value.toJson()));
  //   } catch (_) {}
  // }

  /// ----------------------------------------------------------
  /// Method that clears all shared preference
  /// ----------------------------------------------------------
  Future<bool> clearAll() async {
    try {
      return await sharedPreferences.clear();
    } catch (_) {
      return false;
    }
  }

  /// ----------------------------------------------------------
  /// Method that clears all shared preference except
  /// ----------------------------------------------------------
  Future<bool> clearAllExcept(String myKey) async {
    try {
      for (String key in sharedPreferences.getKeys()) {
        if (key != myKey) {
          await sharedPreferences.remove(key);
        }
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  /// ----------------------------------------------------------
  /// Method that clears selected shared preference
  /// ----------------------------------------------------------
  Future<bool> clearOnly(String mKey) async {
    try {
      return await sharedPreferences.remove(mKey);
    } catch (_) {
      return false;
    }
  }
}

abstract class BaseModel {
  Map toJson();
}

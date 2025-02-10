import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static const loginKey = 'LOGIN_KEY';
  static const loginBox = 'LOGIN_BOX';
  static const token = 'TOKEN';

  static void setValueLoginBox() {
    Hive.box(loginBox).put(loginBox, true);
  }

  static bool checkLoginValue() {
    if (Hive.box(loginBox).isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static void setToken(String tokenParam) {
    Hive.box('USER_BOX').put(token, tokenParam);
  }

  static String? getToken() {
    if (Hive.box('USER_BOX').containsKey(token)) {
      return Hive.box('USER_BOX').get(token);
    }
    return null;
  }

  static Future<void> deleteToken() async {
    final userBox = Hive.box('USER_BOX');

    await userBox.delete(token);
    await userBox.delete('username');
    await userBox.delete('email');

    final loginBox = Hive.box('LOGIN_BOX');
    await loginBox.delete(loginKey);
    debugPrint('Token after deletion: ${userBox.get(token)}');
  }
}

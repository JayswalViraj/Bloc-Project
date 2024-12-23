import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../services/local_storage/shared_pref.dart';
import '../services/local_storage/shared_pref_keys.dart';

loginApp() {
  SharedPrefServices.boolSave(key: SharedPrefKeys.isLogin, value: true);
}

getSharedPref() async {
  Constants.isLogin =
      await SharedPrefServices.boolGet(key: SharedPrefKeys.isLogin) ?? false;
  debugPrint("Constants.isLogin: " + Constants.isLogin.toString());
}

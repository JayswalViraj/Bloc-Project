import 'package:bloc_project/src/my_app.dart';
import 'package:flutter/material.dart';

import 'global/constants/constants.dart';
import 'global/global_functions/global_functions.dart';
import 'global/routes/app_routes_name.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await appInitialization();
  runApp(const MyApp());
}



appInitialization() async {
  await getSharedPref();

  if (Constants.isLogin == true) {
    AppRoutesName.initialPage = AppRoutesName.homePage;
  } else {
    AppRoutesName.initialPage = AppRoutesName.loginPage;
  }
}
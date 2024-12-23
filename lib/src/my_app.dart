import 'package:bloc_project/global/routes/app_routes_name.dart';
import 'package:bloc_project/src/home_page/home_page.dart';
import 'package:bloc_project/src/login_page/login_bloc/login_bloc.dart';
import 'package:bloc_project/src/login_page/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoutesName.loginPage,
        routes: {
          AppRoutesName.loginPage: (context) => LoginView(),
          AppRoutesName.homePage: (context) => HomePage(),
        },
      ),
    );
  }
}

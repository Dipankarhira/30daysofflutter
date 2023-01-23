import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const Login(),
        MyRoutes.homeRoute: (context) => const Home(),
        MyRoutes.loginRoute: (context) => const Login()
      },
    );
  }
}

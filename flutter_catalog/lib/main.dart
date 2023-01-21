import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      routes: {"/": (context) => Login(),
      MyRoutes.homeRoute:(context) => Home(),
      MyRoutes.loginRoute:(context) => Login()
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
            iconTheme: IconThemeData(color: Colors.black)),
      );
}

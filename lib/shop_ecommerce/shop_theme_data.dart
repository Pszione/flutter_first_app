import 'package:flutter/material.dart';

import 'constants_shop.dart';

ThemeData shopAppTheme() {
  return ThemeData(
    appBarTheme: shopBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    textTheme: shopTextTheme(),
    inputDecorationTheme: shopInputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme shopBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
    ),
  );
}

TextTheme shopTextTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextDarkColor),
    bodyText2: TextStyle(color: kTextDarkColor),
  );
}

InputDecorationTheme shopInputDecorationTheme() {
  final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextDarkColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // floating will work if set here?
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    //
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

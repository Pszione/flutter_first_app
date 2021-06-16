import 'package:flutter/material.dart';
import 'package:flutter_first_app/size_config.dart';

// Colors
const Color kPrimaryColor = Color(0xFFFF7643);
const Color kPrimaryLightColor = Color(0xFFFFECDF);
const LinearGradient kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const Color kSecondaryColor = Color(0xFF979797);
const Color kTextColor = Color(0xFF757575);

// Texts
final TextStyle tHeadingStyle = TextStyle(
  fontSize: SizeConfig().getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Animation
const Duration kAnimationDuration = Duration(milliseconds: 250);
const Duration kDefaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp kEmailValidatorRegex =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
const String kEmailNullError = 'Please enter your email';
const String kInvalidEmailError = 'Please enter a valid email';
const String kPassNullError = 'Please enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = 'Please enter your name';
const String kPhoneNumberNullError = 'Please enter your phone number';
const String kAddressNullError = 'Please enter your address';

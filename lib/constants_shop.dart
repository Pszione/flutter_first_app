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
const Color kSecondaryLightColor = Color(0xFFFFDDC7); // #FEE9DB
const Color kTextLightColor = Colors.white;
const Color kTextDarkColor = Color(0xFF757575);
const Color kTextGrayColor = Color(0xFF9e9e9e);

// Texts
final TextStyle tHeadingStyle = TextStyle(
  fontSize: SizeConfig().getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final InputDecoration tOtpInputDecoration = InputDecoration(
  // content padding made it finally work
  contentPadding: EdgeInsets.symmetric(
      vertical: SizeConfig().getProportionateScreenWidth(15)),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(27),
    borderSide: BorderSide(color: kTextDarkColor),
  );
}

final EdgeInsetsGeometry kAppSafeBorder = EdgeInsets.symmetric(
  horizontal: SizeConfig().getProportionateScreenWidth(20),
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

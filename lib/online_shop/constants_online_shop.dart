import 'package:flutter/material.dart';

import '../size_config.dart';

const Color kPrimaryColor = Color(0xFFFF7643);
const Color kSecondaryColor = Color(0xFF979797);
const Color kTextColor = Color(0xFF535353);
const Color kTextLightColor = Color(0xFFACACAC);

final EdgeInsetsGeometry kAppSafeBorder = EdgeInsets.symmetric(
  horizontal: SizeConfig().getProportionateScreenWidth(20),
);
final double kAppSafeBorderAs = SizeConfig().getProportionateScreenWidth(20);

// Animation
const Duration kAnimationDuration = Duration(milliseconds: 250);
const Duration kDefaultDuration = Duration(milliseconds: 250);

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class FormErrorChecker extends StatelessWidget {
  const FormErrorChecker({
    Key key,
    @required SizeConfig sizes,
    @required this.errors,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (int index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: _sizes.getProportionateScreenWidth(14),
          width: _sizes.getProportionateScreenWidth(14),
        ),
        SizedBox(width: _sizes.getProportionateScreenWidth(10)),
        Text(error),
      ],
    );
  }
}

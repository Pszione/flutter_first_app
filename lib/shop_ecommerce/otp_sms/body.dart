import 'package:flutter/material.dart';
import 'package:flutter_first_app/constants_shop.dart';
import 'package:flutter_first_app/shop_ecommerce/components/otp_sms_forms.dart';

import '../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _sizes.getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'OTP Verification',
                  style: tHeadingStyle,
                ),
                Text(
                  'We sent your code to +55 898 860 ***',
                  textAlign: TextAlign.center,
                ),
                buildTimerText(),
                SizedBox(height: SizeConfig.screenHeight * 0.11),
                OtpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                GestureDetector(
                  onTap: () {
                    // resend your OTP
                  },
                  child: Text(
                    'Resend OTP Code',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('This code will expire in '),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30), // because we allow user 30s
          builder: (BuildContext context, double value, Widget child) => Text(
              '00:${value.toInt()}',
              style: TextStyle(color: kPrimaryColor)),
        ),
      ],
    );
  }
}

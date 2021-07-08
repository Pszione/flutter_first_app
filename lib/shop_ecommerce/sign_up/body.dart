import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/components/sign_up_forms.dart';

import '../constants_shop.dart';
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
                  'Register Account',
                  style: tHeadingStyle,
                ),
                Text(
                  'Complete your details or continue \nwith social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                SignUpForms(),
                SizedBox(height: _sizes.getProportionateScreenHeight(30)),
                Text(
                  'By continuing you confirm that you agree \nwith our Terms of Services',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: _sizes.getProportionateScreenHeight(50)),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

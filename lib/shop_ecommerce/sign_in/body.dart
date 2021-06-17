import 'package:flutter/material.dart';

import 'package:flutter_first_app/shop_ecommerce/components/sign_forms.dart';
import 'package:flutter_first_app/size_config.dart';

import '../components/no_account_sign_up.dart';

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
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: _sizes.getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sign in with your email and password \nor continue with social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                SignForms(),
                SizedBox(height: _sizes.getProportionateScreenHeight(50)),
                NoAccountSignUp(sizes: _sizes),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

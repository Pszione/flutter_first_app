import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/complete_profile/body.dart';

class ShopCompleteSignUpProfileScreen extends StatelessWidget {
  const ShopCompleteSignUpProfileScreen({Key key}) : super(key: key);
  static String routeName = '/complete_sign_up_profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}

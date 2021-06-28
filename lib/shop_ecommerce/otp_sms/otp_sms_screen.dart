import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/otp_sms/body.dart';

class ShopOtpSmsScreen extends StatelessWidget {
  const ShopOtpSmsScreen({Key key}) : super(key: key);
  static String routeName = '/otp_sms';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Body(),
    );
  }
}

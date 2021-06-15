import 'package:flutter/material.dart';

class ShopLoginSuccessScreen extends StatelessWidget {
  const ShopLoginSuccessScreen({Key key}) : super(key: key);
  static String routeName = '/login_success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Success'),
      ),
    );
  }
}

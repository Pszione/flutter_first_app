import 'package:flutter/material.dart';

class ShopSignInScreen extends StatelessWidget {
  const ShopSignInScreen({Key key}) : super(key: key);
  static String routeName = '/sign_in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sign In')),
      ),
    );
  }
}

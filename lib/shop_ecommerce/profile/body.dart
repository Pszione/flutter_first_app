import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/profile/profile_picture.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePicture(),
      ],
    );
  }
}

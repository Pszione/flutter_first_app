import 'package:flutter/material.dart';
import 'package:flutter_first_app/online_shop/constants_online_shop.dart';
import 'package:flutter_first_app/online_shop/home_screen/categories.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kAppSafeBorderAs),
          child: Text(
            'Women',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
      ],
    );
  }
}

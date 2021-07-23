import 'package:flutter/material.dart';
import 'package:flutter_first_app/online_shop/constants_online_shop.dart';
import 'package:flutter_first_app/online_shop/home_screen/categories.dart';
import 'package:flutter_first_app/online_shop/models/product.dart';

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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kAppSafeBorderAs),
          child: Categories(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kAppSafeBorderAs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(kAppSafeBorderAs),
                height: 180,
                width: 160,
                decoration: BoxDecoration(
                  color: demoProducts[0].color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(demoProducts[0].image),
              ),
              Padding(
                padding: EdgeInsets.only(top: kAppSafeBorderAs / 2),
                child: Text(
                  demoProducts[0].title,
                  style: TextStyle(color: kTextColor, fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  '\$${demoProducts[0].price}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

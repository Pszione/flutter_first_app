import 'package:flutter/material.dart';
import 'package:flutter_first_app/constants_shop.dart';
import 'package:flutter_first_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        // What double.infinity means?
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              // child: Container(
              //   color: Colors.black,
              // ),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Text(
                    'ECOMMERCE',
                    style: TextStyle(
                      fontSize: _sizes.getProportionateScreenWidth(36),
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Welcome to your Ecommerce, let's shop!"),
                  Spacer(
                    flex: 2,
                  ),
                  Image.asset(
                    'assets/images/splash_1.png',
                    width: _sizes.getProportionateScreenWidth(235),
                    height: _sizes.getProportionateScreenHeight(265),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

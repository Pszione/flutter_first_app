import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/constants_shop.dart';
import 'package:flutter_first_app/size_config.dart';

import '../components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    final List<Map<String, String>> splashesData = <Map<String, String>>[
      <String, String>{
        'subtitle': "Welcome to your Ecommerce, let's shop!",
        'image': 'assets/images/splash_1.png'
      },
      <String, String>{
        'subtitle':
            'We help people connect with stores \naround United States of America',
        'image': 'assets/images/splash_2.png'
      },
      <String, String>{
        'subtitle': 'We show the easy way to shop. \nJust stay at home with us',
        'image': 'assets/images/splash_3.png'
      },
    ];
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
              child: PageView.builder(
                itemCount: splashesData.length,
                itemBuilder: (BuildContext context, int index) => SplashContent(
                  sizes: _sizes,
                  // checking array for null safety
                  subtitle: splashesData[index]['subtitle'] ?? 'Error',
                  image: splashesData[index]['image'] ?? 'Error',
                ),
                onPageChanged: (int value) {
                  setState(() {
                    currentPage = value;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Row(
                    children: List.generate(
                      splashesData.length,
                      (int index) => buildPagesDot(index: index),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildPagesDot({int index}) {
    return Container(
      height: 6,
      // Different width for the selected dot
      width: currentPage == index ? 20 : 6,
      // Margin only at right - acts like a spacer
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

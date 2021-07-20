import 'package:flutter/material.dart';

import '../constants_online_shop.dart';

class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = <String>[
    'Hand bag',
    'Jewellery',
    'Footwear',
    'Dresses'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kAppSafeBorderAs),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) =>
              buildCategoryTitle(index),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget buildCategoryTitle(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kAppSafeBorderAs * 0.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? kTextColor : kTextLightColor),
            ),
            if (index == selectedIndex)
              Container(
                margin: EdgeInsets.only(top: kAppSafeBorderAs / 4),
                height: 2,
                width: 33,
                color: Colors.black,
              )
          ],
        ),
      ),
    );
  }
}

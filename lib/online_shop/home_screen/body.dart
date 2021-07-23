import 'package:flutter/material.dart';
import 'package:flutter_first_app/online_shop/constants_online_shop.dart';
import 'package:flutter_first_app/online_shop/home_screen/categories.dart';
import 'package:flutter_first_app/online_shop/home_screen/product_card.dart';
import 'package:flutter_first_app/online_shop/models/product.dart';
import 'package:flutter_first_app/online_shop/product_details/shop_product_details_screen.dart';

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
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kAppSafeBorderAs),
            child: GridView.builder(
              itemCount: demoProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.73,
                mainAxisSpacing: kAppSafeBorderAs,
                crossAxisSpacing: kAppSafeBorderAs,
              ),
              itemBuilder: (BuildContext context, int index) => ProductCard(
                product: demoProducts[index],
                onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute<ProductDetailsScreen>(
                      builder: (BuildContext context) => ProductDetailsScreen(
                        product: demoProducts[index],
                      ),
                    )),
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}

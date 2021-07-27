import 'package:flutter/material.dart';
import 'package:flutter_first_app/online_shop/constants_online_shop.dart';
import 'package:flutter_first_app/online_shop/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    @required this.product,
    @required this.onPress,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            // ninja solution to make them fill equally
            child: Container(
              padding: EdgeInsets.all(kAppSafeBorderAs),
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Hero(
                tag: product.id.toString(), // animation info link
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text.rich(
              TextSpan(
                text: '${product.title}\n',
                style: TextStyle(color: kTextColor, fontSize: 17),
                children: <TextSpan>[
                  TextSpan(
                    text: '\$${product.price}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

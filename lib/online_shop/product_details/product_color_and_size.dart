import 'package:flutter/material.dart';
import 'package:flutter_first_app/online_shop/models/product.dart';

import '../constants_online_shop.dart';
import 'color_dot.dart';

class ProductColorAndSize extends StatelessWidget {
  const ProductColorAndSize({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Product Color'),
              Row(
                children: const <Widget>[
                  ColorDot(
                    color: Color(0xFF356C95),
                    isSelected: true,
                  ),
                  ColorDot(
                    color: Color(0xFFF8C078),
                  ),
                  ColorDot(
                    color: Color(0xFFA29B9B),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: <TextSpan>[
                TextSpan(text: 'Product Size\n'),
                TextSpan(
                    text: '${product.size} cm',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
      ], // Color
    );
  }
}

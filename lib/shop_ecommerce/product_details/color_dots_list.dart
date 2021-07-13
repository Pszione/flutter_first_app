import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';
import 'package:flutter_first_app/shop_ecommerce/product_details/app_bar_with_rating.dart';

import '../../size_config.dart';
import '../constants_shop.dart';

class ColorDotsList extends StatelessWidget {
  const ColorDotsList({
    Key key,
    @required SizeConfig sizes,
    @required this.product,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final Product product;

  @override
  Widget build(BuildContext context) {
    const int selectedColor = 1;
    return Padding(
      padding: kAppSafeBorder,
      child: Row(
        children: <Widget>[
          ...List<ColorDot>.generate(
            product.availableColors.length,
            (int index) => ColorDot(
              sizes: _sizes,
              color: product.availableColors[index],
              isSelected: selectedColor == index,
            ),
          ),
          Spacer(),
          RoundedIconBtn(
            sizes: _sizes,
            icon: Icons.remove,
            onPress: () {},
          ),
          SizedBox(width: _sizes.getProportionateScreenWidth(15)),
          RoundedIconBtn(
            sizes: _sizes,
            icon: Icons.add,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    @required SizeConfig sizes,
    @required this.color,
    this.isSelected = false,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      padding: EdgeInsets.all(8),
      width: _sizes.getProportionateScreenWidth(40),
      height: _sizes.getProportionateScreenWidth(40),
      // Border
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: isSelected ? kPrimaryColor : Colors.grey.shade300),
      ),
      // Inner shape
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

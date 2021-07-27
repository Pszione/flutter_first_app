import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants_online_shop.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int countOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlinedButton(Icons.remove, () {
          if (countOfItems > 1) {
            setState(() {
              countOfItems--;
            });
          }
        }),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kAppSafeBorderAs / 2),
          child: Text(
            // if our counter is less than 10 it show "01, 02, 03"
            countOfItems.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlinedButton(Icons.add, () {
          if (countOfItems < 99) {
            setState(() {
              countOfItems++;
            });
          }
        }),
      ],
    );
  }

  SizedBox buildOutlinedButton(IconData icon, VoidCallback onPress) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero, // center it
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(140),
        ),
        onPressed: onPress,
        child: Icon(icon),
      ),
    );
  }
}

class ProductCounterWithFavorite extends StatelessWidget {
  const ProductCounterWithFavorite({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(),
        Container(
          padding: EdgeInsets.all(8),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset('assets/icons/heart.svg'),
        )
      ],
    );
  }
}

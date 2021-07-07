import 'package:flutter/material.dart';

import '../../size_config.dart';

class CashbackBanner extends StatelessWidget {
  const CashbackBanner({
    Key key,
    @required SizeConfig sizes,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: _sizes.getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
          horizontal: _sizes.getProportionateScreenWidth(20),
          vertical: _sizes.getProportionateScreenWidth(15)),
      width: double.infinity,
      //height: 90,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          text: 'A Summer Surprise\n',
          style: TextStyle(color: Colors.white),
          children: const <TextSpan>[
            TextSpan(
              text: 'Cashback 13%',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class CashbackBanner extends StatelessWidget {
  const CashbackBanner({
    Key key,
    @required SizeConfig sizes,
    this.bgColor = Colors.deepPurple,
    this.textColor = Colors.white,
    @required this.onPress,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final Color bgColor;
  final Color textColor;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _sizes.getProportionateScreenWidth(20),
        ),
        child: InkWell(
          onTap: onPress,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: _sizes.getProportionateScreenWidth(20),
                vertical: _sizes.getProportionateScreenWidth(15)),
            width: double.infinity,
            //height: 90,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text.rich(
              TextSpan(
                text: 'A Summer Surprise\n',
                style: TextStyle(color: textColor),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Cashback 13%',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

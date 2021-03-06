import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../constants_shop.dart';

class DefaultBigButton extends StatelessWidget {
  const DefaultBigButton({
    Key key,
    @required SizeConfig sizes,
    @required this.text,
    @required this.onPress,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _sizes.getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          // primary: Colors.white, // in fact, this is clicked color
          backgroundColor: kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          //elevation: 5,
          //side: BorderSide(color: Colors.black, width: 5),
        ),
        onPressed: () => onPress.call(),
        child: Text(
          text,
          style: TextStyle(
            fontSize: _sizes.getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

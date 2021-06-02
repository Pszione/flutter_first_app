import 'package:flutter/material.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';

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
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kPrimaryColor,
        //style: ButtonStyle(backgroundColor: MaterialStateProperty<kPrimaryColor>),
        onPressed: () => onPress,
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

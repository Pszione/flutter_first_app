import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/home_screen/shop_home_screen.dart';

import '../../size_config.dart';
import '../constants_shop.dart';
import 'default_big_button.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin1FocusNode;
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void jumpToNextField(
      {String fieldValue, FocusNode currentNode, FocusNode focusNode}) {
    if (fieldValue.length == 1) {
      focusNode.requestFocus();
    }
    if (fieldValue.length > 1) {
      currentNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return Form(
      child: Column(
        children: <Widget>[
          buildOtpNumbersRow(_sizes),
          SizedBox(height: SizeConfig.screenHeight * 0.2),
          DefaultBigButton(
            sizes: _sizes,
            text: 'Verify!',
            onPress: () {
              Navigator.pushNamed(context, ShopHomeScreen.routeName);
            },
          ),
          SizedBox(height: _sizes.getProportionateScreenHeight(30)),
        ],
      ),
    );
  }

  Row buildOtpNumbersRow(SizeConfig _sizes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: _sizes.getProportionateScreenWidth(60),
          child: TextFormField(
            keyboardType: TextInputType.number,
            autofocus: true,
            focusNode: pin1FocusNode,
            // obscureText: true,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
            decoration: tOtpInputDecoration,
            onChanged: (String fieldValue) {
              jumpToNextField(
                  fieldValue: fieldValue,
                  currentNode: pin1FocusNode,
                  focusNode: pin2FocusNode);
            },
          ),
        ),
        SizedBox(
          width: _sizes.getProportionateScreenWidth(60),
          child: TextFormField(
            keyboardType: TextInputType.number,
            focusNode: pin2FocusNode,
            // obscureText: true,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
            decoration: tOtpInputDecoration,
            onChanged: (String fieldValue) {
              jumpToNextField(
                  fieldValue: fieldValue,
                  currentNode: pin2FocusNode,
                  focusNode: pin3FocusNode);
            },
          ),
        ),
        SizedBox(
          width: _sizes.getProportionateScreenWidth(60),
          child: TextFormField(
            keyboardType: TextInputType.number,
            focusNode: pin3FocusNode,
            // obscureText: true,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
            decoration: tOtpInputDecoration,
            onChanged: (String fieldValue) {
              jumpToNextField(
                  fieldValue: fieldValue,
                  currentNode: pin3FocusNode,
                  focusNode: pin4FocusNode);
            },
          ),
        ),
        SizedBox(
          width: _sizes.getProportionateScreenWidth(60),
          child: TextFormField(
            keyboardType: TextInputType.number,
            focusNode: pin4FocusNode,
            // obscureText: true,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
            decoration: tOtpInputDecoration,
            onChanged: (String fieldValue) {
              pin4FocusNode.unfocus();
            },
          ),
        ),
      ],
    );
  }
}

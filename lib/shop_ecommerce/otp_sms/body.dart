import 'package:flutter/material.dart';
import 'package:flutter_first_app/constants_shop.dart';

import '../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _sizes.getProportionateScreenWidth(20),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                'OTP Verification',
                style: tHeadingStyle,
              ),
              Text(
                'We sent your code to +55 898 860 ***',
                textAlign: TextAlign.center,
              ),
              buildTimerText(),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('This code will expire in '),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30), // because we allow user 30s
          builder: (BuildContext context, double value, Widget child) => Text(
              '00:${value.toInt()}',
              style: TextStyle(color: kPrimaryColor)),
        ),
      ],
    );
  }
}

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
      child: Row(
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
      ),
    );
  }

  SizedBox buildOtpInputNumber(
      SizeConfig _sizes, bool autofocus, FocusNode nextFocusNode) {
    return SizedBox(
      width: _sizes.getProportionateScreenWidth(60),
      child: TextFormField(
        keyboardType: TextInputType.number,
        autofocus: autofocus,
        // obscureText: true,
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
        decoration: tOtpInputDecoration,
        onChanged: (String fieldValue) {
          jumpToNextField(fieldValue: fieldValue, focusNode: nextFocusNode);
        },
      ),
    );
  }
}

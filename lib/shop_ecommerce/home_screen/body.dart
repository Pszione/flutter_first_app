import 'package:flutter/material.dart';
import 'package:flutter_first_app/constants_shop.dart';
import 'package:flutter_first_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _sizes.getProportionateScreenWidth(20),
                ),
                child: buildSearchBarRow(_sizes),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildSearchBarRow(SizeConfig _sizes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(height: SizeConfig.screenHeight * 0.1),
        Container(
          width: SizeConfig.screenWidth * 0.6, // 60%
          // height: 60,
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            onChanged: (String value) {
              // search by string
            },
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search Product',
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                horizontal: _sizes.getProportionateScreenWidth(20),
                vertical: _sizes.getProportionateScreenWidth(9),
              ),
            ),
          ),
        ),
        Stack(
          // Sobrepor two widgets
          clipBehavior: Clip.none, // Overflow.visible
          children: <Widget>[
            Container(
              width: _sizes.getProportionateScreenWidth(46),
              height: _sizes.getProportionateScreenWidth(46),
              padding: EdgeInsets.all(_sizes.getProportionateScreenWidth(11)),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/icons/Bell.svg',
              ),
            ),
            Positioned(
              right: 0, // positioned made it work
              child: Container(
                width: _sizes.getProportionateScreenWidth(16),
                height: _sizes.getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontSize: _sizes.getProportionateScreenWidth(10),
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

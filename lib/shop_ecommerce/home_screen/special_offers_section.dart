import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/components/section_title.dart';

import '../../size_config.dart';
import '../constants_shop.dart';

class SpecialOffersSection extends StatelessWidget {
  const SpecialOffersSection({
    Key key,
    @required SizeConfig sizes,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionTitle(
          sizes: _sizes,
          text: 'Special for you',
          onPressMore: () {},
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.01),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SpecialOfferCard(
                sizes: _sizes,
                imagePath: 'assets/images/Image Banner 2.png',
                title: 'Smartphone',
                subtitle: '18 Brands',
                onPress: () {},
              ),
              SpecialOfferCard(
                sizes: _sizes,
                imagePath: 'assets/images/Image Banner 3.png',
                title: 'Fashion',
                subtitle: '',
                onPress: () {},
              ),
              // always at the end
              SizedBox(width: kAppSafeBorderAs),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required SizeConfig sizes,
    @required this.imagePath,
    @required this.title,
    this.subtitle,
    @required this.onPress,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final String imagePath, title, subtitle;
  // final int numOfBrands = 0;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: kAppSafeBorderAs),
      child: SizedBox(
        width: _sizes.getProportionateScreenWidth(242),
        height: _sizes.getProportionateScreenWidth(100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: <Widget>[
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
              Container(
                // gradient just to make it a bit darker for the text
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xFF343434).withOpacity(0.4),
                      Color(0xff343434).withOpacity(0.10),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _sizes.getProportionateScreenWidth(15),
                  vertical: _sizes.getProportionateScreenWidth(10),
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: <InlineSpan>[
                      TextSpan(
                        text: '$title\n',
                        style: TextStyle(
                            fontSize: _sizes.getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold),
                      ),
                      if (subtitle != null) TextSpan(text: subtitle)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/components/default_big_button.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';
import 'package:flutter_first_app/shop_ecommerce/product_details/base_rounded_container.dart';
import 'package:flutter_first_app/shop_ecommerce/product_details/color_dots_list.dart';
import 'package:flutter_first_app/shop_ecommerce/product_details/product_description_section.dart';
import 'package:flutter_first_app/shop_ecommerce/product_details/product_images_carousel.dart';
import 'package:flutter_first_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key, @required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    const double heartSpacing = 64;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ProductImages(sizes: _sizes, product: product),
          BaseRoundedContainer(
            sizes: _sizes,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ProductDescription(
                  product: product,
                  sizes: _sizes,
                  heartSpacing: heartSpacing,
                  onPressMore: () {},
                ),
                BaseRoundedContainer(
                  sizes: _sizes,
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: <Widget>[
                      ColorDotsList(product: product, sizes: _sizes),
                      BaseRoundedContainer(
                        sizes: _sizes,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            //top: _sizes.getProportionateScreenWidth(10),
                            bottom: _sizes.getProportionateScreenWidth(40),
                          ),
                          child: DefaultBigButton(
                            sizes: _sizes,
                            text: 'Add to Cart!',
                            onPress: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

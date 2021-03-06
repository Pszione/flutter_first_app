import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/components/section_title.dart';
import 'package:flutter_first_app/shop_ecommerce/home_screen/product_card.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';
import 'package:flutter_first_app/shop_ecommerce/product_details/shop_product_details_screen.dart';

import '../../size_config.dart';
import '../constants_shop.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({
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
          text: 'Popular Products',
          onPressMore: () {},
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.01),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...List<Widget>.generate(demoProducts.length, (int index) {
                return ProductCard(
                  sizes: _sizes,
                  product: demoProducts[index],
                  onPressViewDetails: () => Navigator.pushNamed(
                    context,
                    ShopProductDetailsScreen.routeName,
                    arguments:
                        ProductDetailsArguments(product: demoProducts[index]),
                  ),
                );
                // if (demoProducts[index].isPopular) {
                //   return ProductCard(
                //     sizes: _sizes,
                //     product: demoProducts[index],
                //     productLink: '/endpoint',
                //   );
                // }
                // // here by default width and height is 0
                // return SizedBox.shrink();
              }),
              // always at the end
              SizedBox(width: kAppSafeBorderAs),
            ],
          ),
        ),
      ],
    );
  }
}

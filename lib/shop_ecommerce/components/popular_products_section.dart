import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/components/product_card.dart';
import 'package:flutter_first_app/shop_ecommerce/components/section_title.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';

import '../../constants_shop.dart';
import '../../size_config.dart';

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
          onPress: () {},
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.01),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...List<ProductCard>.generate(
                demoProducts.length,
                (int index) => ProductCard(
                  sizes: _sizes,
                  product: demoProducts[index],
                  productLink: '/endpoint',
                ),
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

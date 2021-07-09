import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';
import 'package:flutter_first_app/size_config.dart';

import '../constants_shop.dart';

class Body extends StatelessWidget {
  const Body({Key key, @required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizes = SizeConfig().init(context);
    return ProductImages(sizes: _sizes, product: product);
  }
}

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key key,
    @required SizeConfig sizes,
    @required this.product,
  })  : _sizes = sizes,
        super(key: key);

  final SizeConfig _sizes;
  final Product product;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: widget._sizes.getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(widget.product.images[0]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...List.generate(
              widget.product.images.length,
              (int index) => buildSmallPreview(index),
            ),
          ],
        )
      ],
    );
  }

  Container buildSmallPreview(int index) {
    return Container(
      margin:
          EdgeInsets.only(right: widget._sizes.getProportionateScreenWidth(15)),
      padding: EdgeInsets.all(widget._sizes.getProportionateScreenWidth(4)),
      width: widget._sizes.getProportionateScreenWidth(54),
      height: widget._sizes.getProportionateScreenWidth(54),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color:
                selectedImage == index ? kPrimaryColor : Colors.grey.shade300,
            width: 2.2),
      ), // 10
      child: Image.asset(widget.product.images[index]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/models/product.dart';

class Cart {
  const Cart({@required this.product, @required this.numOfItems});

  final Product product;
  final int numOfItems;
}

// Out demo cart data
List<Cart> demoCarts = <Cart>[
  Cart(product: demoProducts[0], numOfItems: 2),
  Cart(product: demoProducts[1], numOfItems: 1),
  Cart(product: demoProducts[3], numOfItems: 1),
];

double getDemoCartTotalPrice() {
  if (demoCarts == null || demoCarts.isEmpty) {
    return 0;
  } else {
    double total = 0;
    for (final Cart item in demoCarts) {
      total += item.product.price * item.numOfItems;
    }
    return total;
  }
}

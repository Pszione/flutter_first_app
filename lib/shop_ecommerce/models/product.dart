import 'package:flutter/material.dart';

class Product {
  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.images,
    @required this.availableColors,
    this.rating = 0.0,
    this.isFavorite = false,
    this.isPopular = false,
  });

  final int id;
  final String title, description;
  final double price;
  final List<String> images;
  final List<Color> availableColors;
  final double rating;
  final bool isFavorite, isPopular;
}

// Our demo Products
List<Product> demoProducts = <Product>[
  Product(
    id: 1,
    images: <String>[
      'assets/images/ps4_console_white_1.png',
      'assets/images/ps4_console_white_2.png',
      'assets/images/ps4_console_white_3.png',
      'assets/images/ps4_console_white_4.png',
    ],
    availableColors: <Color>[
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Wireless Controller for PS4™',
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavorite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: <String>[
      'assets/images/Image Popular Product 2.png',
    ],
    availableColors: <Color>[
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Nike Sport White - Man Pant',
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: <String>[
      'assets/images/glap.png',
    ],
    availableColors: <Color>[
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Gloves XC Omega - Polygon',
    price: 36.55,
    description: description,
    rating: 3.9,
    isFavorite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: <String>[
      'assets/images/wireless headset.png',
    ],
    availableColors: <Color>[
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Logitech Head',
    price: 20.20,
    description: description,
    rating: 4.0,
    isFavorite: true,
  ),
];

const String description =
    'Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …';

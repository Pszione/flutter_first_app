import 'package:flutter/material.dart';

class Product {
  Product({
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.images,
    @required this.availableColors,
    this.rating = 0.0,
    this.isFavorite = false,
    this.isPopular = false,
  });

  final String title, description;
  final double price;
  final List<String> images;
  final List<Color> availableColors;
  final double rating;
  final bool isFavorite, isPopular;
}

import 'package:flutter/material.dart';

import '../constants_online_shop.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    @required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color; // Color(0xFF356C95)
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.5),
      margin: EdgeInsets.only(
        top: kAppSafeBorderAs / 4,
        right: kAppSafeBorderAs / 2,
      ),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        // Border
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      // Fill
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants_shop.dart';

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    Key key,
    @required this.title,
    @required this.iconPath,
    @required this.onPress,
    this.background = const Color(0xFFF5F6F9),
  }) : super(key: key);

  final String title, iconPath;
  final Color background;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: FlatButton(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: background,
        onPressed: () {},
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              iconPath,
              width: 22,
              color: kPrimaryColor,
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Text(title, style: Theme.of(context).textTheme.bodyText1),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}

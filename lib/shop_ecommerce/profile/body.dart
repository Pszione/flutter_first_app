import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/profile/profile_menu_card.dart';
import 'package:flutter_first_app/shop_ecommerce/profile/profile_picture.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ProfilePicture(),
          const SizedBox(height: 20),
          ProfileMenuCard(
            title: 'My Account',
            //iconPath: 'assets/icons/User Icon.svg',
            iconPath: 'assets/icons/google-icon.svg',
            onPress: () {},
          ),
          ProfileMenuCard(
            title: 'Your orders',
            iconPath: 'assets/icons/Bill Icon.svg',
            onPress: () {},
          ),
          ProfileMenuCard(
            title: 'Log Out!',
            iconPath: 'assets/icons/Log out.svg',
            onPress: () {},
          ),
          const SizedBox(height: 30),
          ProfileMenuCard(
            title: 'Notifications',
            iconPath: 'assets/icons/Bell.svg',
            onPress: () {},
          ),
          ProfileMenuCard(
            title: 'Settings',
            iconPath: 'assets/icons/Question mark.svg',
            onPress: () {},
          ),
          ProfileMenuCard(
            title: 'Help Center',
            iconPath: 'assets/icons/User Icon.svg',
            onPress: () {},
            background: Colors.red.shade100,
          ),
          const SizedBox(height: 20),
          ProfileMenuCard(
            title: 'Stars',
            iconPath: 'assets/icons/Star Icon.svg',
            onPress: () {},
          ),
          ProfileMenuCard(
            title: 'Additional',
            iconPath: 'assets/icons/Question mark.svg',
            onPress: () {},
          ),
        ],
      ),
    );
  }
}

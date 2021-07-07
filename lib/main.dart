import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/shop_ecommerce/routes.dart';
import 'package:flutter_first_app/shop_ecommerce/shop_theme_data.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/theme_mode_changer.dart';
import 'homepage_first_app.dart';
import 'homepage_friendly_chat.dart';
import 'homepage_google_tutorial01.dart';
import 'homepage_riverpod_simplified.dart';
import 'shop_ecommerce/splash/homepage_shop_splashscreen.dart';

void main() {
  runApp(AppShopEcommerce());
}

//
final ThemeModeChanger themeChanger = ThemeModeChanger();

class AppShopEcommerce extends StatelessWidget {
  const AppShopEcommerce({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: shopAppTheme(),
      //home: ShopSplashScreen(),
      initialRoute: ShopSplashScreen.routeName,
      routes: routes,
    );
  }
}

class AppFriendlyChat extends StatelessWidget {
  const AppFriendlyChat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return ChangeNotifierProvider<ThemChanger>(
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friendly Chat',
      home: ChatScreen(
        themeChanger: themeChanger,
      ),
      theme: themeChanger.getTheme(),
      // theme: defaultTargetPlatform == TargetPlatform.iOS
      //     ? kIOSTheme
      //     : kMaterialTheme,
      // darkTheme: defaultTargetPlatform == TargetPlatform.iOS
      //     ? themeChanger.chatIOSTheme // ?
      //     : themeChanger.chatDarkMaterialTheme,
      //themeMode: currentThemeMode,
    );
  }
}

class AppGoogleTutorial01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final myWordPair = WordPair.random(); // here!

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: RandomWords(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Welcome to Flutter'),
      //   ),
      //   body: Center(
      //     child: Text(
      //       'Hello World! - PS',
      //       generateWordPairs().take(1).first.toString(),
      //       WordPair.random().asPascalCase,
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      // ),
      theme: ThemeData(
        primarySwatch: Colors.amber, // 0xFFFFC107
        //primaryColor: Colors.white,
        accentColor: Colors.amber,
      ),
    );
  }
}

class AppRiverpodTrial extends StatelessWidget {
  const AppRiverpodTrial({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Simplified',
      home: MySecondaryHomePage(
        title: 'Riverpod Simplified',
      ),
      //
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: const TextStyle(),
          headline4: GoogleFonts.lobster(
            color: Colors.redAccent,
            letterSpacing: 2,
          ),
        ),
        accentIconTheme: const IconThemeData(
          size: 33,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //primarySwatch: Colors.amber, // 0xFFFFC107
        primaryColor:
            const Color(0xFFFFC107), // let Material create all variants
        accentColor: const Color(0xFFFFFFFF), // 0xFF + copy HEX then (688e26)
      ),
    );
  }
}

class AppFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter First App',
      home: MyHomePage(title: 'Flutter First App'),
      //
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: const TextStyle(),
          headline4: GoogleFonts.lobster(
            color: Colors.redAccent,
            letterSpacing: 2,
          ),
          bodyText2: const TextStyle(fontSize: 18),
          subtitle1: const TextStyle(
            fontStyle: FontStyle.italic,
            color: Color(0xFF00FF00),
          ),
        ),
        accentIconTheme: const IconThemeData(
          size: 33,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //primarySwatch: Colors.amber, // 0xFFFFC107
        //primarySwatch: MaterialColor(0xFFFFC107, {50: Color(), 100: Color()},),
        primaryColor:
            const Color(0xFFFFC107), // let Material create all variants
        accentColor: const Color(0xFFFFFFFF), // 0xFF + copy HEX then (688e26)
      ),
    );
  }
}

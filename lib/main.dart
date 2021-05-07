import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:english_words/english_words.dart';

import 'homePageFirstApp.dart';
import 'homePageRiverpodSimplified.dart';
import 'homePageGoogleTutorial01.dart';
import 'homePageFriendlyChat.dart';
import 'themeModeChanger.dart';

void main() {
  runApp(AppFriendlyChat());
}

//
final ThemeModeChanger themeChanger = ThemeModeChanger();

class AppFriendlyChat extends StatelessWidget {
  const AppFriendlyChat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friendly Chat',
      home: ChatScreen(themeChanger: themeChanger,),
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

class AppFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter First App',

      theme: ThemeData(
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke "hot reload"
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        textTheme: TextTheme(
          headline1: TextStyle(),
          headline4: GoogleFonts.lobster(
            color: Colors.redAccent,
            letterSpacing: 2,
          ),
          bodyText2: TextStyle(fontSize: 18),
          subtitle1: TextStyle(
            fontStyle: FontStyle.italic,
            color: Color(0xFF00FF00),
          ),
        ),
        accentIconTheme: IconThemeData(
          size: 33,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //primarySwatch: Colors.amber, // 0xFFFFC107
        //primarySwatch: MaterialColor(0xFFFFC107, {50: Color(), 100: Color()},),
        primaryColor:
            Color(0xFFFFC107), // let Material create all other variants
        accentColor: Color(0xFFFFFFFF), // 0xFF + copy HEX then (688e26)
      ),
      home: MyHomePage(title: 'Flutter First App'),
      //home: MySecondaryHomePage(title: 'Riverpod Simplified',),
    );
  }
}

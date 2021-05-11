import 'package:flutter/material.dart';
//import '../services/storage_manager.dart';

class ThemeModeChanger {
  bool _isDarkMode = false;
  ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  ThemeModeChanger() {
    _isDarkMode ? _themeData = chatDarkMaterialTheme : _themeData = chatMaterialTheme;
    //   StorageManager.readData('themeMode').then((value) {
    //     print('value read from storage: ' + value.toString());
    //     var themeMode = value ?? 'light';
    //     if (themeMode == 'light') {
    //       _themeData = lightTheme;
    //     } else {
    //       print('setting dark theme');
    //       _themeData = darkTheme;
    //     }
    //     notifyListeners();
    //   });
  }

  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  // return Theme.of(context).platform == TargetPlatform.iOS
  //      ? chatIOSTheme
  //      : chatMaterialTheme;

  void toggleThemeMode() { //async {
    _isDarkMode = !_isDarkMode;
    _isDarkMode ? setLightMode() : setDarkMode();
  }

  void setDarkMode() { //async {
    //_themeData = darkTheme;
    _themeData = chatDarkMaterialTheme;
    //StorageManager.saveData('themeMode', 'dark');
    //notifyListeners();
  }

  void setLightMode() { //async {
    //_themeData = lightTheme;
    _themeData = chatMaterialTheme;
    //StorageManager.saveData('themeMode', 'light');
    //notifyListeners();
  }

  //
  final ThemeData chatIOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light,
  );
  final ThemeData chatMaterialTheme = ThemeData(
    accentColor: Colors.orangeAccent[400],
    primarySwatch: Colors.amber, // 0xFFFFC107
    //primaryColor: Colors.white,
    //accentColor: Colors.amber,
    //primarySwatch: Colors.purple,
  );
  final ThemeData chatDarkMaterialTheme = ThemeData.from(
      colorScheme: ColorScheme.highContrastDark(
    surface: Colors.purple[900],
  ));
}

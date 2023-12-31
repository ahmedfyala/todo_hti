import 'package:flutter/material.dart';

class MyProviderApp extends ChangeNotifier {
  String AppLanguage = 'en';
  ThemeMode themeMode = ThemeMode.light;

  void changeLanguage(String languageCode) {
    AppLanguage = languageCode;
    notifyListeners();
  }

  void changeTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }
}

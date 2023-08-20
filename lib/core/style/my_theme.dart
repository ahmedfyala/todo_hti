import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: tdGreen,
    primaryColor: tdGreen,
    focusColor: tdBGColor,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: tdBlue,
      ),
      toolbarHeight: 157,
      backgroundColor: tdBlue,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: tdBGColor,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: tdBGColor,
      elevation: 0.0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      selectedItemColor: tdBlue,
      unselectedItemColor: tdGray,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: tdBlack,
    primaryColor: tdBlack,
    focusColor: taskBlack,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: tdBlue,
      ),
      toolbarHeight: 157,
      backgroundColor: tdBlue,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: tdBlack,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: taskBlack,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      selectedItemColor: tdBlue,
      unselectedItemColor: tdGray,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: tdGreen,
    appBarTheme: AppBarTheme(
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

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      selectedItemColor: tdBlue,
      unselectedItemColor: tdGray,
    ),
  );
  static ThemeData darkTheme = ThemeData();
}

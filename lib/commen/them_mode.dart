import 'package:flutter/material.dart';
import 'package:news_app/commen/appcolor.dart';

class AppThem {
  static ThemeData lightmode = ThemeData(
    iconTheme: IconThemeData(color: Appcolors.darkcolor),
    hintColor: Appcolors.darkcolor,
    scaffoldBackgroundColor: Appcolors.lightcolor,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Appcolors.darkcolor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),

      iconTheme: IconThemeData(color: Appcolors.darkcolor, size: 16),
      backgroundColor: Appcolors.lightcolor,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Appcolors.darkcolor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Appcolors.darkcolor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  static ThemeData darktmode = ThemeData(
    drawerTheme: DrawerThemeData(backgroundColor: Appcolors.lightcolor),
    iconTheme: IconThemeData(color: Appcolors.lightcolor),
    hintColor: Appcolors.lightcolor,

    scaffoldBackgroundColor: Appcolors.darkcolor,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Appcolors.lightcolor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Appcolors.lightcolor),
      backgroundColor: Appcolors.darkcolor,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Appcolors.lightcolor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Appcolors.lightcolor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

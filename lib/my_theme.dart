import 'package:flutter/material.dart';

class MyTheme{
  static const Color lightPrimaryColor=Color(0xFFB7935F);
  static const Color darkPrimaryColor=Color(0xFF1D2746);
  static const Color darkSecondaryColor=Color(0xFFFACC1D);

  static final ThemeData lightTheme=ThemeData(
    primaryColor: lightPrimaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: lightPrimaryColor,
      selectedItemColor:Colors.black ,
      unselectedItemColor:Colors.white ,
      selectedIconTheme: IconThemeData(
        color: Colors.black,
        size: 40,
      ) ,
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      selectedLabelStyle: TextStyle(
        color: Colors.black,
      ) ,
      unselectedLabelStyle:  TextStyle(
        color: Colors.white,
      ) ,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
  );
  static final ThemeData darkTheme=ThemeData(
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkPrimaryColor,
      selectedItemColor:Colors.black ,
      unselectedItemColor:Colors.white ,
      selectedIconTheme: IconThemeData(
        color: darkSecondaryColor,
        size: 40,
      ) ,
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      selectedLabelStyle: TextStyle(
        color: darkSecondaryColor,
      ) ,
      unselectedLabelStyle:  TextStyle(
        color: Colors.white,
      ) ,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
  );

}
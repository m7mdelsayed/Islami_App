import 'package:flutter/material.dart';

class MyTheme{
  static const Color lightPrimaryColor=Color(0xFFB7935F);
  static const Color darkPrimaryColor=Color(0xFF1D2746);
  static const Color darkSecondaryColor=Color(0xFFFACC1D);

  static final ThemeData lightTheme=ThemeData(
    accentColor: lightPrimaryColor,
    primaryColor: lightPrimaryColor,
    cardColor: Colors.white,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )
      )
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      headline4: TextStyle(
        fontSize: 28 ,
        color: Colors.black,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
    ),
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
    accentColor: darkSecondaryColor,
    primaryColor: darkPrimaryColor,
    cardColor: darkPrimaryColor,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: darkPrimaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            )
        )
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      headline4: TextStyle(
        fontSize: 24 ,
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    ),
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
      selectedItemColor:darkSecondaryColor ,
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
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.dark;
  Locale currentLanguage = const Locale('ar');

  void changeTheme(ThemeMode newMode) {
    currentTheme = newMode;
    notifyListeners();
  }
  String getMainBackgroundImage(){
    return currentTheme==ThemeMode.dark
        ?   'assets/images/main_background_dark.png'
        :   'assets/images/main_background.png';
  }
  bool isDarkMode(){
    return currentTheme==ThemeMode.dark;
  }
  String getRadioImage(){
    return currentTheme==ThemeMode.light
        ? 'assets/images/radio_light.png'
        : 'assets/images/radio_dark.png';
  }
  void changeLanguage(Locale newLocale){
    currentLanguage=newLocale;
    notifyListeners();
  }
  bool isArabic(){
    return currentLanguage==const Locale('ar');
  }
}

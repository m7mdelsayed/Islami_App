import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash-screen';
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Image.asset(
        settingsProvider.isDarkMode()
        ? 'assets/images/splash_image_dark.png'
        : 'assets/images/splash_image_light.png',fit: BoxFit.fill,
    );
  }
}

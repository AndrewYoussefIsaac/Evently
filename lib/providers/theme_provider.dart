import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light ;

  void toggleTheme () {
    ( themeMode == ThemeMode.light )? themeMode = ThemeMode.dark : themeMode = ThemeMode.light ;
    notifyListeners() ;
  }
}
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = .light ;

  void setTheme ( ThemeMode theme ) {
    themeMode = theme ;
    notifyListeners() ;
  }
}
import 'package:evently/core/services/shared_preference_service.dart';
import 'package:flutter/material.dart';
import 'package:evently/core/utilities/app_keys.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeMode themeMode = ThemeMode.light;
  
  ThemeProvider(){
    getTheme() ;
  }

  void getTheme() {
    String? savedTheme = SharedPrefsService.getData(key: AppKeys.themeKey);
    if (savedTheme != null) {
      themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  void setTheme(ThemeMode newTheme) {
    if (themeMode == newTheme) return ;
    themeMode = newTheme;
    SharedPrefsService.setData(
      key: AppKeys.themeKey,
      value: newTheme == ThemeMode.dark ? 'dark' : 'light',
    );
    notifyListeners();
  }

}
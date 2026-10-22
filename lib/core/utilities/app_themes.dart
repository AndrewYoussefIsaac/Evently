import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
    splashColor: AppColors.transparent ,
    highlightColor: AppColors.transparent ,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightPrimaryColor ,
      foregroundColor: AppColors.textColor , 
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50) ,
        borderSide: .none ,
      ) ,
      elevation: 5 ,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0 ,
      backgroundColor: AppColors.lightBgColor ,
      selectedItemColor: AppColors.lightPrimaryColor ,
      unselectedItemColor: AppColors.lightSecTextColor ,
      selectedLabelStyle: AppFonts.regular12.copyWith( color: AppColors.lightPrimaryColor ) ,
      unselectedLabelStyle: AppFonts.regular12.copyWith( color: AppColors.lightSecTextColor ) ,
      selectedIconTheme: IconThemeData( color:  AppColors.lightPrimaryColor ) ,
      unselectedIconTheme: IconThemeData( color: AppColors.lightSecTextColor ) ,
      type: .fixed ,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent ,
      surfaceTintColor: AppColors.transparent ,
      centerTitle: true ,
      elevation: 0 ,
    ),
    scaffoldBackgroundColor: AppColors.lightBgColor,
    primaryColor: AppColors.lightPrimaryColor ,
    colorScheme: ColorScheme(
      brightness: .light , 
      primary:  AppColors.lightPrimaryColor , 
      onPrimary: AppColors.lightBgColor , 
      secondary: AppColors.lightSecTextColor, 
      onSecondary: AppColors.textColor, 
      error: Colors.red, 
      onError: Colors.white , 
      surface: AppColors.lightBgColor , 
      onSurface: AppColors.lightPrimaryColor ,
    ) ,
  ) ;

  static ThemeData darkTheme = ThemeData(
    splashColor: AppColors.transparent ,
    highlightColor: AppColors.transparent ,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkPrimaryColor ,
      foregroundColor: AppColors.textColor , 
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50) ,
        borderSide: .none ,
      ) ,
      elevation: 5 ,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0 ,
      backgroundColor: AppColors.darkBgColor ,
      selectedItemColor: AppColors.darkPrimaryColor ,
      unselectedItemColor: AppColors.darkSecTextColor ,
      selectedLabelStyle: AppFonts.regular12.copyWith( color: AppColors.darkPrimaryColor ) ,
      unselectedLabelStyle: AppFonts.regular12.copyWith( color: AppColors.lightSecTextColor ) ,
      selectedIconTheme: IconThemeData( color:  AppColors.darkPrimaryColor ) ,
      unselectedIconTheme: IconThemeData( color: AppColors.lightSecTextColor ) ,
      type: .fixed ,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent ,
      surfaceTintColor: AppColors.transparent ,
      centerTitle: true ,
    ),
    scaffoldBackgroundColor: AppColors.darkBgColor,
    primaryColor: AppColors.darkPrimaryColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkPrimaryColor,
      onPrimary: AppColors.textColor, 
      secondary: AppColors.darkSecTextColor,
      onSecondary: AppColors.textColor,
      error: AppColors.red,
      onError: AppColors.textColor,
      surface: AppColors.darkBgColor,
      onSurface: AppColors.textColor,
    ),
  );
  
}
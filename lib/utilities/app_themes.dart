import 'package:evently/utilities/app_colors.dart';
import 'package:evently/utilities/app_textstyles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData themeLight  = ThemeData( 
    colorScheme: const ColorScheme(
      brightness: Brightness.light , 
      primary: AppColors.primary, 
      onPrimary: AppColors.white, 
      secondary:  AppColors.white , 
      onSecondary: AppColors.black , 
      error: AppColors.red , 
      onError: AppColors.white , 
      surface: AppColors.white , 
      onSurface:  AppColors.black  , 
    )  ,
    textTheme: TextTheme(
      displayLarge: AppTextstyles.headline.copyWith( color: AppColors.white )
    )
  ) ;
  
  static final ThemeData themeDark  = ThemeData( 
    colorScheme: const ColorScheme(
      brightness: Brightness.dark , 
      primary: AppColors.primary, 
      onPrimary: AppColors.white, 
      secondary:  AppColors.secondaryDark , 
      onSecondary: AppColors.black , 
      error: AppColors.red , 
      onError: AppColors.white , 
      surface: AppColors.surfaceDark , 
      onSurface:  AppColors.white  , 
    )  ,
    textTheme: TextTheme(
      displayLarge: AppTextstyles.headline.copyWith( color: AppColors.white )
    )
  ) ;
}
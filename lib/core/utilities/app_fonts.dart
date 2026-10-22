import 'package:evently/core/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


abstract class AppFonts {

  static  TextStyle regular12 = TextStyle(
    fontSize: 12.sp ,
    fontWeight: .w400 ,
    fontFamily : "Poppins" ,
  ) ;
  static  TextStyle regular14 = TextStyle(
    fontSize: 14.sp ,
    fontWeight: .w400 ,
    fontFamily : "Poppins" ,
  ) ;
  static  TextStyle regular16LightSec = TextStyle(
    fontSize: 16.sp ,
    fontWeight: .w400 ,
    fontFamily : "Poppins" ,
    color: AppColors.lightSecTextColor ,
  ) ;

  static  TextStyle medium14 = TextStyle(
    fontSize: 14.sp ,
    fontWeight: .w500 ,
    fontFamily : "Poppins" ,
  ) ;
  static  TextStyle medium16 = TextStyle(
    fontSize: 16.sp ,
    fontWeight: .w500 ,
    fontFamily : "Poppins" ,
  ) ;
  static  TextStyle medium18 = TextStyle(
    fontSize: 18.sp ,
    fontFamily : "Poppins" ,
    fontWeight: .w500 ,
  ) ;
  static  TextStyle medium20 = TextStyle(
    fontSize: 20.sp ,
    fontFamily : "Poppins" ,
    fontWeight: .w500 ,
  ) ;
  
  static  TextStyle semiBold16 = TextStyle(
    fontSize: 16.sp ,
    fontWeight: .w600 ,
    fontFamily : "Poppins" ,
  ) ;
  static  TextStyle semiBold14White = TextStyle(
    fontSize: 14.sp ,
    fontFamily : "Poppins" ,
    fontWeight: .w600 ,
    color: AppColors.lightBgColor
  ) ;
  static  TextStyle semiBold20 = TextStyle(
    fontSize: 20.sp ,
    fontFamily : "Poppins" ,
    fontWeight: .w600 ,
  ) ;
  static  TextStyle semiBold24 = TextStyle(
    fontSize: 24.sp ,
    fontFamily : "Poppins" ,
    fontWeight: .w600 ,
  ) ;

  static  TextStyle bold16 = TextStyle(
    fontSize: 16.sp ,
    fontWeight: .bold ,
    fontFamily : "Poppins" ,
  ) ;
  static  TextStyle bold20Black = TextStyle(
    fontSize: 20.sp ,
    fontFamily : "Poppins" ,
    fontWeight: .bold ,
    color: AppColors.lightTextColor
  ) ;
  
}
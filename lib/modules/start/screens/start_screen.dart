import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:evently/core/utilities/routes/app_route_names.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:evently/core/widgets/selection_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>( context ) ;
    bool isLightMode = themeProvider.themeMode == ThemeMode.light ; 
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 16.0 ),
            child: Column(
              children: [
                Hero( 
                  tag: "Evently", 
                  child: SizedBox(
                    width: 142.w ,
                    height: 27.h ,
                    child: Image( 
                      image: AssetImage(AppImages.evently ) ,
                      color: isLightMode ? AppColors.lightPrimaryColor : AppColors.darkPrimaryColor ,
                    )
                  ) ,
                ),
                SizedBox(height: 24.h , ),
                Image( 
                  width: 343.w ,
                  height: 343.h ,
                  image: AssetImage( AppImages.startScreen ) ,
                  color: ( isLightMode )? AppColors.lightPrimaryColor : AppColors.textColor  ,
                ) ,
                SizedBox(height: 24.h , ),
                Align(
                  alignment: .centerStart ,
                  child: Text( "startPage_title".tr() , 
                    style: AppFonts.bold20Black.copyWith(
                      color: (isLightMode) ? AppColors.lightTextColor : AppColors.textColor ,
                    ) ,
                  ) ,
                ) ,
                SizedBox(height: 8.h , ),
                Align(
                  alignment: .centerStart ,
                  child: Text(
                    "startPage_discription".tr() , 
                    style: AppFonts.regular16LightSec.copyWith(
                      color: isLightMode ? AppColors.lightSecTextColor : AppColors.darkSecTextColor ,
                    ) ,
                  )
                ) ,
                SizedBox(height: 16.h , ),
                Row(
                  textDirection: .ltr ,
                  children: [
                    Text(
                      "language".tr() , 
                      style: AppFonts.medium18.copyWith(
                        color: isLightMode ? AppColors.lightPrimaryColor : AppColors.textColor 
                      ),
                    ) , 
                    Spacer() ,
                    SelectionItem( isSelected: context.locale.languageCode == 'en' , title: "english".tr(),
                      onTap: () {
                        if (context.locale.languageCode == 'ar') {
                          context.setLocale(const Locale('en'));
                        } else {
                          context.setLocale(const Locale('ar'));
                        }
                      },
                    ),
                    SizedBox( width: 10.w ,) ,
                    SelectionItem( isSelected: context.locale.languageCode == 'ar' , title: "arabic".tr(),
                      onTap: () {
                        if (context.locale.languageCode == 'ar') {
                          context.setLocale(const Locale('en'));
                        } else {
                          context.setLocale(const Locale('ar'));
                        }
                      },
                    ),
                  ],
                ) ,
                SizedBox(height: 16.h , ),
                Row(
                  textDirection: .ltr ,
                  children: [
                    Text(
                      "theme".tr() , 
                      style: AppFonts.medium18.copyWith(
                        color: isLightMode ? AppColors.lightPrimaryColor : AppColors.textColor 
                      ) ,
                    ) , 
                    Spacer() ,
                    SelectionItem(
                      isSelected: themeProvider.themeMode == ThemeMode.light , 
                      icon: AppImages.sun , 
                      onTap: () => themeProvider.setTheme( ThemeMode.light ) ,
                    ),
                    SizedBox( width: 10.w ,) ,
                    SelectionItem( 
                      isSelected: themeProvider.themeMode == ThemeMode.dark , 
                      icon: AppImages.moon ,
                      onTap: () => themeProvider.setTheme( ThemeMode.dark ) ,
                    ),
                  ],
                ) ,
                SizedBox( height: 24 ,) ,
                CustomButton( title: "let’s start".tr() , isLoading: false , 
                  onTap: () {
                    Navigator.pushReplacementNamed( context , AppRouteNames.loginScreen ) ;
                  } ,
                ) ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context) ;
    bool isLight = themeProvider.themeMode == ThemeMode.light ;
    return Container(
      width: .infinity,
      height: MediaQuery.heightOf(context) * 0.53,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        spacing: 30,
        crossAxisAlignment: .start,
        children: [
          InkWell(
            onTap: () => context.setLocale(Locale("ar")),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("arabic".tr(), style: AppFonts.medium18),
                context.locale.languageCode == "ar"
                    ? Icon(
                      Icons.check ,
                      size: 30 , 
                      color: isLight 
                          ? AppColors.lightPrimaryColor
                          : AppColors.textColor  ,
                    )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          InkWell(
            onTap: () => context.setLocale(Locale("en")),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "english".tr(),
                  style: AppFonts.medium18,
                ),
                context.locale.languageCode == "en"
                    ? Icon(
                      Icons.check ,
                      size: 30 , 
                      color: isLight 
                          ? AppColors.lightPrimaryColor
                          : AppColors.textColor  ,
                    )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
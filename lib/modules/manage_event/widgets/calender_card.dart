import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CalenderCard extends StatelessWidget {
  const CalenderCard({super.key, required this.dateTime});
  final DateTime dateTime ;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == .light;
    return Container(
      height: 76.h ,
      width: .infinity ,
      decoration: BoxDecoration(
        color: isLight
            ? AppColors.white
            : AppColors.darkInputsColor,
        borderRadius: BorderRadius.circular(16.r) ,
        border: Border.all(
          color: isLight
              ? AppColors.disableColor 
              : AppColors.darkStrokeColor ,
          width: 1.5.w ,
        ) ,
      ),
      child: Row(
        spacing: 16.w ,
        crossAxisAlignment: .center ,
        children: [
          SizedBox( width: 16.w , ) , 
          Container(
            width: 44.w ,
            height: 44.h ,
            decoration: BoxDecoration(
              color: isLight
                  ? AppColors.lightBgColor 
                  : AppColors.darkInputsColor,
              border: BoxBorder.all(
                color: isLight 
                    ? AppColors.disableColor 
                    : AppColors.darkStrokeColor ,
                width: 1.5.w ,
              ),
              borderRadius: BorderRadius.circular(8.r) ,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AppImages.calendar ,
                colorFilter: .mode(  
                  isLight
                      ? AppColors.lightPrimaryColor
                      : AppColors.darkPrimaryColor ,
                  .srcIn
                ) ,
              ),
            ),
          ) , 
          Column(
            mainAxisAlignment: .center ,
            crossAxisAlignment: .start ,
            spacing: 8.h ,
            children: [
              Text( 
                DateFormat("dd MMMM").format(dateTime) , // handle date ( day , month , year ) format 
                style: AppFonts.medium16.copyWith(
                  color: isLight
                      ? AppColors.lightTextColor
                      : AppColors.darkPrimaryColor 
                ) ,
              ) ,
              Text(
                DateFormat.jm().format(dateTime) , // handle time ( am / pm ) format 
                style: AppFonts.medium16.copyWith(
                  color: isLight
                      ? AppColors.lightSecTextColor
                      : AppColors.textColor 
                ) ,
              ) ,
            ],
          ) ,
        ],
      ),
    );
  }
}
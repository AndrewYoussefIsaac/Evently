import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.title,
    required this.icon,
    this.isSelected = false,
  });

  final String title;
  final String icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(
      context,
      listen: true,
    );
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? isLight
                    ? AppColors.lightPrimaryColor
                    : AppColors.darkPrimaryColor
              : isLight
              ? AppColors.textColor
              : AppColors.darkInputsColor,
          borderRadius: BorderRadius.circular(16.r),
          border: isLight 
          ? null 
          : Border.all(color: AppColors.darkStrokeColor , width: 1.8  ),
        ),
        child: Row(
          spacing: 10,
          children: [
            SvgPicture.asset(
              icon , 
              width: 24.w ,
              height: 24.h , 
              fit: .contain ,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.textColor
                    : isLight
                        ? AppColors.lightPrimaryColor
                        : AppColors.darkStrokeColor , 
                .srcIn ,
              ),
            ),
            Text(title , style: AppFonts.medium16 ),
          ],
        ),
      ),
    );
  }
}

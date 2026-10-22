import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({
    super.key,
    required this.title,
    required this.body,
    this.borderRadius = 8,
    required this.color,
  });

  final String title;
  final Widget body;
  final double borderRadius;
  final Color color;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == ThemeMode.light ;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color ,
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: isLight
            ? null
            : BoxBorder.all(color: AppColors.darkStrokeColor, width: 1.8),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppFonts.medium16.copyWith(
                color: isLight ? AppColors.lightTextColor : AppColors.textColor,
              ),
            ),
          ),
          body,
        ],
      ),
    );
  }
}

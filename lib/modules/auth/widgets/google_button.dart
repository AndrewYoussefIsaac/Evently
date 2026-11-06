import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, required this.title, required this.onTap});
  final String title ;
  final VoidCallback onTap ;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLightMode = themeProvider.themeMode == ThemeMode.light;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r) ,
          side: BorderSide(
            color: isLightMode
            ? AppColors.disableColor 
            : AppColors.darkStrokeColor
          ) ,
        ),
        backgroundColor: isLightMode
            ? AppColors.white
            : AppColors.darkInputsColor ,
        minimumSize: Size(0.w, 48.h),
      ) ,
      onPressed: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: .center ,
          spacing: 16.w ,
          children: [
            SvgPicture.asset(AppImages.google  , width: 24.w , height: 24.h , ) ,
            Text(
              title,
              style: AppFonts.medium20.copyWith(
                color: isLightMode
                    ? AppColors.lightPrimaryColor
                    : AppColors.darkPrimaryColor ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

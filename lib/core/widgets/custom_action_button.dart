import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({super.key, required this.onTap, required this.icon});
  final VoidCallback onTap ;
  final Widget icon ;
  @override
  Widget build(BuildContext context) {
        ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
        bool isLightMode = themeProvider.themeMode == .light ;
    return Navigator.canPop(context) ? Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: onTap ,
            borderRadius: BorderRadius.circular(8.r),
            child: FittedBox(
              fit: .scaleDown ,
              child: Container(
                padding: EdgeInsets.all( 4 ),
                decoration: BoxDecoration(
                  color: isLightMode ? Colors.white : AppColors.darkInputsColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: isLightMode ? AppColors.textColor : AppColors.darkStrokeColor ,
                    width: 1.5.w ,
                  ),
                ),
                child: icon
              ),
            ),
          ),
        ) : SizedBox.shrink() ;
  }
}
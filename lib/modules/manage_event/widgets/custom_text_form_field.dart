import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.validator ,
    this.expands = false,
  });
  final String label;
  final bool expands;
  final TextEditingController controller;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == .light;
    bool isEn = context.locale.languageCode == "en";

    return TextFormField(
      controller: controller,
      validator: validator ,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus() ,
      expands: expands,
      maxLines: null,
      minLines: null,
      textAlignVertical: .top ,
      style: AppFonts.regular14 ,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: AppFonts.regular14.copyWith( color: AppColors.lightSecTextColor , ),
        hintTextDirection: isEn ? .ltr : .rtl,
        filled: true,
        fillColor: isLight ? AppColors.textColor : AppColors.darkInputsColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(16.r),
          borderSide: BorderSide(
            width: 2.w,
            color: isLight
                ? AppColors.lightStrokeColor
                : AppColors.darkStrokeColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(16.r),
          borderSide: BorderSide(
            width: 2.w,
            color: isLight
                ? AppColors.lightStrokeColor
                : AppColors.darkStrokeColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: .circular(16.r),
          borderSide: BorderSide(
            width: 2.w,
            color: isLight
                ? AppColors.lightStrokeColor
                : AppColors.darkStrokeColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: .circular(16.r),
          borderSide: BorderSide(width: 2.w, color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: .circular(16.r),
          borderSide: BorderSide(width: 2.w, color: AppColors.red),
        ),
      ),
    );
  }
}

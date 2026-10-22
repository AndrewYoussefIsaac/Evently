import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.controller, required this.onChanged});

  final TextEditingController controller ;
  final Function(String)? onChanged ;
  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context) ;
    bool islight = theme.themeMode == ThemeMode.light ;
    return SizedBox(
      width: 343.w ,
      height: 48.h ,
      child: TextField(
        controller: controller ,
        onChanged: onChanged ,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r) ,
            borderSide: BorderSide(
              color: islight ? AppColors.disableColor : AppColors.darkPrimaryColor ,
              width: 2.w
            )
          ) ,
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r) ,
            borderSide: BorderSide(
              color: islight ? AppColors.disableColor : AppColors.darkPrimaryColor ,
              width: 2.w
            ) ,
          ) ,
          filled: true ,
          fillColor: islight ? AppColors.textColor : AppColors.darkInputsColor ,
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric( horizontal: 15.w , vertical: 5.h  ),
            child: SvgPicture.asset( 
              AppImages.search ,
              fit: .contain ,
              colorFilter: ColorFilter.mode(
                islight 
                    ? AppColors.lightPrimaryColor 
                    : AppColors.darkPrimaryColor ,
                .srcIn
                ),
            ),
          ) ,
          hint: Text( "search".tr() ,
            style: AppFonts.regular14.copyWith(
              color: islight 
                ? AppColors.lightSecTextColor 
                : AppColors.textColor
            )
          ) ,
        ),
      ),
    ) ;
  }
}
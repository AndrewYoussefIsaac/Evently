import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({super.key , this.isPassword = false, required this.title, required this.icon, required this.validator, required this.controller });
  final bool isPassword ;
  final String title ;
  final String icon ;
  final Function(String?) validator ;
  final TextEditingController controller ;
  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool secure = true ;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>( context ) ;
    bool isLightMode = themeProvider.themeMode == ThemeMode.light ; 
    return TextFormField(
      controller: widget.controller ,
      obscureText: widget.isPassword ? secure : false ,
      keyboardType: .emailAddress ,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus() ,
      validator: (value) =>  widget.validator(value) ,
      decoration: InputDecoration(
        filled: true ,
        fillColor: isLightMode ? AppColors.textColor : AppColors.darkInputsColor ,
        contentPadding: EdgeInsets.symmetric( vertical: 8.h , horizontal: 16.w ),
        prefixIconConstraints: BoxConstraints(  ) ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r) ,
          borderSide: BorderSide(
            color: isLightMode ? AppColors.disableColor : AppColors.darkStrokeColor ,
            width: 1.w ,
          ) ,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r) ,
          borderSide: BorderSide(
            color: isLightMode ? AppColors.disableColor : AppColors.darkStrokeColor ,
            width: 1.w ,
          ) ,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r) ,
          borderSide: BorderSide(
            color: isLightMode ? AppColors.disableColor : AppColors.darkStrokeColor ,
            width: 1.5.w ,
          ) ,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r) ,
          borderSide: BorderSide(
            color: isLightMode ? AppColors.red : AppColors.red ,
            width: 1.5.w ,
          ) ,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only( left: 16.0 , right: 8 ),
          child: SvgPicture.asset( widget.icon , height: 24.h , width: 24.w ,),
        ) ,
        suffixIcon: widget.isPassword ? Padding(
          padding: const EdgeInsets.only( left: 16.0 , right: 16 ),
          child: InkWell(
            onTap: () {
              setState(() {
                secure = ! secure ;
              });
            },
            child: secure ? SvgPicture.asset( AppImages.eyeSlash , height: 20.h , width: 20.w ,) 
            : Icon( Icons.remove_red_eye_outlined  ) 
          ),
        ) : SizedBox.shrink() ,
        hint: Text( widget.title.tr() , 
          style: AppFonts.regular14.copyWith(
            color: isLightMode ? AppColors.lightTextColor : AppColors.textColor ,
          ),
        ) ,
      ),
    ) ;
  }
}
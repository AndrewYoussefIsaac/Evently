import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.title, required this.isLoading, required this.onTap});
  final String title ;
  final bool isLoading ;
  final VoidCallback onTap ;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>( context ) ;
    bool isLightMode = themeProvider.themeMode == ThemeMode.light ; 
    return CupertinoButton(
      borderRadius: BorderRadius.circular(16.r) ,
      padding: const EdgeInsets.all(5),
      color: isLightMode ? AppColors.lightPrimaryColor : AppColors.darkPrimaryColor ,
      disabledColor: isLightMode ? AppColors.lightPrimaryColor : AppColors.darkPrimaryColor ,
      foregroundColor: isLightMode ? AppColors.lightStrokeColor : AppColors.textColor ,
      minimumSize: Size( 0.w , 48.h ) ,
      onPressed: widget.isLoading ? null :() => widget.onTap() ,
      child: AnimatedCrossFade(
        firstChild: SizedBox(
          width: double.infinity ,
          child: Center(
            child: Text( widget.title , 
              style: AppFonts.medium20.copyWith( 
                color:  isLightMode ? AppColors.lightStrokeColor : AppColors.textColor
              ) ,
            ),
          ),
        ) , 
        secondChild: SizedBox(
          width: 48.w ,
          height: 48.h ,
          child: CupertinoActivityIndicator( color: AppColors.textColor , ) ,
        ) ,
        crossFadeState: widget.isLoading ? .showSecond : .showFirst , 
        duration: const Duration(milliseconds: 300 ) ,
      ),
    ) ;
  }
}
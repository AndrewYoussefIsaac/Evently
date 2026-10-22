import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectionItem extends StatelessWidget {
  const SelectionItem({
    super.key,
    this.title,
    this.icon,
    required this.isSelected, 
    required this.onTap, 
    this.isSquare = false ,
  });

  final String? title;
  final String? icon;
  final bool isSquare;
  final bool isSelected;
  final VoidCallback onTap ;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color unselectedBgColor = (theme.brightness == Brightness.light) ?
        AppColors.textColor
        : AppColors.darkInputsColor;
    return InkWell(
      onTap: () => onTap() ,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isSquare ? 8.h : 16.h ,
          vertical: isSquare ? 8.h : 4.h ,
        ) ,
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : unselectedBgColor ,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: (title != null)
            ? Text(
                title!,
                style: AppFonts.semiBold14White.copyWith(
                  color: isSelected ? Colors.white : theme.primaryColor,
                  fontWeight: isSelected ? .w600 : .w400 ,
                ),
              )
            : Image( 
              image: AssetImage(icon!) , 
              color: isSelected ? Colors.white : theme.primaryColor,
            ),
      ),
    );
  }
}

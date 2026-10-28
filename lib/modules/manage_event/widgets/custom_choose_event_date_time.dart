import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomChooseEventDateTime extends StatelessWidget {
  const CustomChooseEventDateTime({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.underlinedTitle,
  });

  final String image;
  final String title;
  final VoidCallback onTap;
  final String underlinedTitle;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == .light;
    return Row(
      crossAxisAlignment: .center ,
      children: [
        SvgPicture.asset(
          image,
          width: 24.w,
          height: 24.h,
          colorFilter: .mode(
            isLight ? AppColors.lightPrimaryColor : AppColors.darkPrimaryColor,
            .srcIn,
          ),
        ),
        SizedBox(width: 10.w),
        Text(title.tr(), style: AppFonts.medium16),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            underlinedTitle.tr(),
            style: AppFonts.regular14.copyWith(decoration: .underline),
          ),
        ),
      ],
    );
  }
}

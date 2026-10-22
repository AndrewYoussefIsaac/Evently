import 'package:easy_localization/easy_localization.dart';
import 'package:evently/modules/main_layout/manager/layout_provider.dart';
import 'package:evently/modules/main_layout/widgets/custom_tabbar.dart';
import 'package:evently/core/widgets/selection_item.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(
      context,
      listen: true,
    );
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return AppBar(
      centerTitle: false,
      title: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisSize: .min,
            textDirection: context.locale.languageCode == 'ar' ? .rtl : .ltr,
            children: [
              Text(
                "welcome".tr(),
                style: AppFonts.regular14.copyWith(
                  color: isLight
                      ? AppColors.lightSecTextColor
                      : AppColors.textColor,
                ),
              ),
              Text("✨"),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            "${FirebaseAuth.instance.currentUser?.displayName}",
            style: AppFonts.medium20.copyWith(
              color: isLight ? AppColors.lightTextColor : AppColors.textColor,
            ),
          ),
        ],
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 8.w),
      actions: [
        GestureDetector(
          onTap: () => isLight
              ? themeProvider.setTheme(.dark)
              : themeProvider.setTheme(.light),
          child: Image.asset(
            isLight ? AppImages.sun : AppImages.moon,
            color: isLight
                ? AppColors.lightPrimaryColor
                : AppColors.darkPrimaryColor,
            width: 24.w,
            height: 24.h,
          ),
        ),
        SizedBox(width: 8.w),
        SelectionItem(
          isSelected: true,
          isSquare: true,
          title: context.locale.languageCode == "en" ? "EN" : "AR",
          onTap: () {
            context.locale.languageCode == "en"
                ? context.setLocale(Locale("ar"))
                : context.setLocale(Locale("en"));
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: .fromHeight(50),
        child: Consumer<LayoutProvider>(
          builder:
              (BuildContext context, LayoutProvider provider, Widget? child) =>
                  CustomTabbar(
                    selectedTab: provider.selectedTab,
                    onTap: provider.updateSelectedTab,
                  ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110.h);
}

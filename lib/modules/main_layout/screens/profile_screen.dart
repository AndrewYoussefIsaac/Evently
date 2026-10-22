import 'package:easy_localization/easy_localization.dart';
import 'package:evently/modules/main_layout/widgets/custom_bar.dart';
import 'package:evently/modules/main_layout/widgets/language_bottom_sheet.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:evently/core/utilities/routes/app_route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              crossAxisAlignment: .center,
              children: [
                ClipOval(
                  child: Image(
                    image: AssetImage(AppImages.userProfile),
                    width: 104.w,
                    height: 104.h,
                    fit: .cover,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  FirebaseAuth.instance.currentUser!.displayName!,
                  style: AppFonts.semiBold20.copyWith(
                    color: isLight
                        ? AppColors.lightTextColor
                        : AppColors.textColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  FirebaseAuth.instance.currentUser!.email!,
                  style: AppFonts.regular14.copyWith(
                    color: AppColors.lightSecTextColor,
                  ),
                ),
                SizedBox(height: 32.h),
                CustomBar(
                  title: "dark_mode".tr(),
                  body: Switch(
                    padding: EdgeInsets.all(0),
                    trackOutlineColor: .all(AppColors.transparent),
                    inactiveThumbColor: AppColors.textColor,
                    inactiveTrackColor: AppColors.disableColor,
                    value: !isLight,
                    onChanged: (theme) =>
                        themeProvider.setTheme(isLight ? .dark : .light),
                  ),
                  borderRadius: 16,
                  color: isLight
                      ? AppColors.textColor
                      : AppColors.darkInputsColor,
                ),
                SizedBox(height: 16.h),
                InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return LanguageBottomSheet() ;
                    },
                  ),
                  child: CustomBar(
                    title: "language".tr(),
                    body: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: isLight
                          ? AppColors.lightPrimaryColor
                          : AppColors.darkPrimaryColor,
                      size: 24.sp,
                    ),
                    borderRadius: 16,
                    color: isLight
                        ? AppColors.textColor
                        : AppColors.darkInputsColor,
                  ),
                ),
                SizedBox(height: 16.h),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouteNames.loginScreen,
                      (route) => false,
                    );
                  },
                  child: CustomBar(
                    title: "logout".tr(),
                    body: Icon(
                      Icons.logout_outlined,
                      color: AppColors.red,
                      size: 24.sp,
                    ),
                    borderRadius: 16,
                    color: isLight
                        ? AppColors.textColor
                        : AppColors.darkInputsColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

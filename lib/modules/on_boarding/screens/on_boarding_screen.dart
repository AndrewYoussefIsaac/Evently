import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/services/shared_preference_service.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:evently/core/utilities/app_keys.dart';
import 'package:evently/core/utilities/routes/app_route_names.dart';
import 'package:evently/core/widgets/custom_action_button.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:evently/modules/on_boarding/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    List<String> buttonTitle = ["next".tr(), "next".tr(), "get_started".tr()];
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLightMode = themeProvider.themeMode == ThemeMode.light;
    return Scaffold(
      appBar: AppBar(
        leading: currentIndex > 0
            ? CustomActionButton(
                onTap: () => pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear,
                ),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: isLightMode
                      ? AppColors.lightPrimaryColor
                      : Colors.white,
                  size: 24.sp,
                ),
              )
            : null,
        title: Hero(
          tag: "Evently",
          child: SizedBox(
            width: 142.w,
            height: 27.h,
            child: Image(
              image: AssetImage(AppImages.evently),
              color: isLightMode
                  ? AppColors.lightPrimaryColor
                  : AppColors.darkPrimaryColor,
            ),
          ),
        ),
        actions: currentIndex < 2
            ? [
                CustomActionButton(
                  onTap: () {
                    SharedPrefsService.setData(
                      key: AppKeys.onBoardingKey,
                      value: true,
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      AppRouteNames.loginScreen,
                    );
                  },
                  icon: Text(
                    "skip".tr(),
                    style: AppFonts.semiBold14White.copyWith(
                      color: isLightMode
                          ? AppColors.lightPrimaryColor
                          : AppColors.white,
                    ),
                  ),
                ),
              ]
            : [],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: .center,
                    children: [
                      PageView.builder(
                        controller: pageController ,
                        itemCount: OnBoardingModel.onBoardingList.length,
                        onPageChanged: (index) {
                          currentIndex = index;
                          setState(() {});
                        },
                        itemBuilder: (context, index) => Column(
                          children: [
                            Image(
                              width: 343.w,
                              height: 343.h,
                              image: AssetImage( OnBoardingModel.onBoardingList[index].image, ),
                              color: isLightMode
                                  ? AppColors.lightPrimaryColor
                                  : AppColors.textColor,
                            ),
                            SizedBox( height: 20.h, ),
                            Align(
                              alignment: .centerStart ,
                              child: Text(
                                OnBoardingModel.onBoardingList[index].title.tr( ) ,
                                style: AppFonts.semiBold20.copyWith(
                                  color : isLightMode
                                    ? AppColors.lightTextColor
                                    : AppColors.darkSecTextColor ,
                                ),
                              ),
                            ) ,
                            SizedBox( height: 8.h, ),
                            Align(
                              alignment: .centerStart ,
                              child: Text(
                                OnBoardingModel.onBoardingList[index].describtion.tr( ) ,
                                style: AppFonts.regular16LightSec.copyWith(
                                  color : isLightMode
                                    ? AppColors.lightTextColor
                                    : AppColors.darkSecTextColor ,
                                ),
                              ),
                            ) ,
                          ],
                        ),
                      ),
                      Positioned(
                        top: 335.h ,
                        child: Row(
                          spacing: 10.w ,
                          children: List.generate( 
                            OnBoardingModel.onBoardingList.length , 
                            (index) => AnimatedContainer(
                              duration: Duration( milliseconds: 300 ) ,
                              decoration: BoxDecoration(
                                color: currentIndex == index 
                                  ? isLightMode
                                      ? AppColors.lightPrimaryColor
                                      : AppColors.darkPrimaryColor 
                                  : isLightMode
                                      ? AppColors.disableColor
                                      : AppColors.white ,
                                borderRadius: BorderRadius.circular(36.r)
                              ),
                              width: currentIndex == index 
                                  ? 21.w 
                                  : 8.w ,
                              height: 8.h ,
                            ) 
                          ) ,
                        )
                      ) ,
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                CustomButton(
                  title: buttonTitle[currentIndex],
                  isLoading: false,
                  onTap: () {
                    if (currentIndex < 2) {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    } else {
                      SharedPrefsService.setData(
                        key: AppKeys.onBoardingKey,
                        value: true,
                      );
                      Navigator.pushReplacementNamed(
                        context,
                        AppRouteNames.loginScreen,
                      );
                    }
                  },
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

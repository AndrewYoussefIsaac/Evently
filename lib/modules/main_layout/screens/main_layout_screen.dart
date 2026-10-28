import 'package:easy_localization/easy_localization.dart';
import 'package:evently/modules/main_layout/manager/layout_provider.dart';
import 'package:evently/modules/main_layout/screens/favorite_screen.dart';
import 'package:evently/modules/main_layout/screens/home_screen.dart';
import 'package:evently/modules/main_layout/screens/profile_screen.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:evently/core/utilities/routes/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  final  List<Widget> screens = const [ HomeScreen() , FavoriteScreen() , ProfileScreen() ] ;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>( context, listen: true );
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return Consumer<LayoutProvider>(
      builder: (BuildContext context, LayoutProvider provider, Widget? child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(
            "+" ,
            style: TextStyle( fontSize: 40 , fontWeight: .w300  ),
          ) ,
          onPressed: () async {
            var isAdded = await Navigator.pushNamed(context, AppRouteNames.manageEventScreen ) ;
            if ( isAdded == true ) {
              provider.getEvents() ;
            }
          } 
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: provider.currentScreen ,
          onTap: provider.updateSelectedScreen ,
          items: [
            BottomNavigationBarItem(
              label: "home".tr(),
              icon: SvgPicture.asset(AppImages.home, width: 24.w, height: 24.h),
              activeIcon: SvgPicture.asset(
                AppImages.filledHome,
                colorFilter: ColorFilter.mode(
                  isLight
                      ? AppColors.lightPrimaryColor
                      : AppColors.darkPrimaryColor,
                  .srcIn,
                ),
                width: 24.w,
                height: 24.h,
              ),
            ),
            BottomNavigationBarItem(
              label: "favorite".tr(),
              icon: SvgPicture.asset(
                AppImages.favorite,
                width: 24.w,
                height: 24.h,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.filledFavorite,
                colorFilter: ColorFilter.mode(
                  isLight
                      ? AppColors.lightPrimaryColor
                      : AppColors.darkPrimaryColor,
                  .srcIn,
                ),
                width: 24.w,
                height: 24.h,
              ),
            ),
            BottomNavigationBarItem(
              label: "profile".tr(),
              icon: SvgPicture.asset(
                AppImages.profile,
                width: 24.w,
                height: 24.h,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.filledProfile,
                colorFilter: ColorFilter.mode(
                  isLight
                      ? AppColors.lightPrimaryColor
                      : AppColors.darkPrimaryColor,
                  .srcIn,
                ),
                width: 24.w,
                height: 24.h,
              ),
            ),
          ],
        ),
        body: screens[provider.currentScreen] ,
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:evently/core/utilities/routes/app_route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>( context ) ;
    bool isLightMode = themeProvider.themeMode == ThemeMode.light ;
    return Scaffold(
      backgroundColor: isLightMode ? AppColors.lightBgColor : AppColors.darkBgColor ,
      body: Center(
        child: Column(
          mainAxisAlignment: .center ,
          children: [
            Expanded(
              child: FadeIn(
                duration: Duration( milliseconds: 500 ),
                child: Hero( 
                  tag: "Evently", 
                  child: SizedBox(
                    width: 309.w ,
                    height: 58.h ,
                    child:  Image( 
                      image: AssetImage(AppImages.evently ) , 
                      color:  isLightMode ? AppColors.lightPrimaryColor : AppColors.darkPrimaryColor ,
                    ) ,
                  ) ,
                ),
              ),
            ) ,
            FadeInUp(
              duration: Duration( milliseconds: 2000 ),
              onFinish: (direction) async {
                await Future.delayed( 
                  Duration(seconds: 1) , 
                );
                if (context.mounted) {
                  if ( FirebaseAuth.instance.currentUser == null ) {
                    Navigator.pushReplacementNamed(context, AppRouteNames.startScreen) ;                                      
                  } else {
                    Navigator.pushReplacementNamed(context, AppRouteNames.mainLayoutScreen) ;
                  }
                }
              },
              child: Image( 
                image: AssetImage(AppImages.route) ,
                color: isLightMode ? AppColors.lightPrimaryColor : AppColors.darkPrimaryColor ,
              ) ,
            ),
            SizedBox( height: 40.h ,) ,
          ],
        ),
      ),
    );
  }
}
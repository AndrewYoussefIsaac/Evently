import 'package:easy_localization/easy_localization.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utilities/app_colors.dart';
import 'package:evently/widgets/setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of( context , listen: true ) ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary ,
        toolbarHeight: 0.2*MediaQuery.heightOf(context),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(64)
          )
        ) ,
        title: Row(
          spacing: 10,
          children: [
            Container(
              width: 124 ,
              height: 124 ,
              decoration: BoxDecoration(
                color: AppColors.white ,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(1000) , 
                  bottomRight: Radius.circular(1000) ,
                  topLeft: Radius.circular(24) ,
                  topRight: Radius.circular(1000) , 
                )
              ),
            ),
            Column(
              spacing: 10 ,
              crossAxisAlignment: .start ,
              children: [
                Text("Andrew Youssef Isaac" ,
                  style: Theme.of(context).textTheme.displayLarge ,
                ) ,
                Text("andrew@gmail.com" ,
                  style: TextStyle(
                    fontSize: 16 ,
                    fontWeight: .w500 ,
                    color: AppColors.white ,
                  ),
                ) ,
              ],
            ) ,
          ],
        ),
      ) ,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0 ,vertical: 30 ),
        child: Column(
          spacing: 20 ,
          children: [
            SettingWidget( 
              title: "language".tr() , 
              onTap: (){
                ( context.locale == Locale("en") ) ? context.setLocale( const Locale("ar") ) 
                : context.setLocale( const Locale("en") )  ;
              } ,
            ) ,
            SettingWidget( 
              title: "theme".tr() , 
              onTap: (){ themeProvider.toggleTheme() ; } ,
            ) ,
          ],
        ),
      ),
    );
  }
}
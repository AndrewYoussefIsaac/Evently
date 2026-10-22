import 'package:easy_localization/easy_localization.dart';
import 'package:evently/modules/main_layout/models/category_model.dart';
import 'package:evently/modules/main_layout/widgets/custom_tab.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({super.key, this.showAll = true, required this.selectedTab, this.onTap });
  final bool showAll ;
  final int selectedTab ;
  final void Function(int)? onTap ;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>( context, listen: true );
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return TabBar(
      padding: EdgeInsets.symmetric( horizontal: 5 ),  // padding around the whole TabBar
      isScrollable: true ,
      tabAlignment: .start ,
      dividerColor: AppColors.transparent,
      labelColor: AppColors.textColor ,
      unselectedLabelColor: isLight 
          ? AppColors.lightTextColor 
          : AppColors.textColor ,
      labelPadding: EdgeInsets.symmetric( horizontal: 5 ),  // padding between each tab 
      indicatorSize: .tab ,
      indicator: BoxDecoration( color: AppColors.transparent , ),
      onTap: onTap ,
      tabs: [
        if ( showAll )
          CustomTab( 
            title: "all".tr() , 
            icon: AppImages.all , 
            isSelected: selectedTab == 0 ,
          ) ,
        ...CategoryModel.categories.asMap().entries.map( 
          (e){
            int currentIndex = e.key ;
            bool isSelected =  showAll 
                ? selectedTab == currentIndex+1 
                : selectedTab == currentIndex ;
            return CustomTab( 
              title: e.value.title.tr() , 
              icon: e.value.icon , 
              isSelected: isSelected ,
            ) ;
          }
        ) ,
      ] ,
    );
  }
}
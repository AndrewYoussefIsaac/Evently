import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/modules/main_layout/models/category_model.dart';
import 'package:evently/modules/main_layout/widgets/custom_bar.dart';
import 'package:evently/modules/main_layout/widgets/favorite_button.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event, required this.onTap});
  final EventModel event ;
  final VoidCallback onTap ;
  
  @override
  Widget build(BuildContext context) {
    CategoryModel category = CategoryModel.categoryMap[ event.categoryId ] ! ;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>( context , listen: true , );
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        height: 193.h,
        width: 343.w,
        decoration: BoxDecoration(
          borderRadius: .circular(16),
          border: isLight
              ? null
              : BoxBorder.all(color: AppColors.darkStrokeColor, width: 1.8 ),
          image: DecorationImage(
            image: AssetImage(
              isLight 
              ? category.image 
              : category.darkImage ,
            ),
            fit: .cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: .spaceBetween ,
            crossAxisAlignment: .start ,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                width:  70.w ,
                height: 40.h ,
                decoration: BoxDecoration(
                  color: isLight
                  ? AppColors.lightStrokeColor
                  : AppColors.darkBgColor ,
                  borderRadius: BorderRadius.circular(8) ,
                  border: isLight
                      ? null
                      : BoxBorder.all(color: AppColors.darkStrokeColor, width: 1.8 ),
                ),
                child: Text( 
                  DateFormat("d MMM").format( event.dateTime) ,
                  style: AppFonts.semiBold16.copyWith(
                    color: isLight
                        ? AppColors.lightPrimaryColor 
                        : AppColors.darkPrimaryColor , 
                  ) ,
                ) ,
              ) ,
              CustomBar(
                title: event.title , 
                body: FavoriteButton( favUsers: event.favUsers , eventId: event.eventId! ,) , 
                color: isLight
                  ? AppColors.lightStrokeColor
                  : AppColors.darkBgColor ,
              ) ,
            ],
          ),
        ),
      ),
    );
  }
}

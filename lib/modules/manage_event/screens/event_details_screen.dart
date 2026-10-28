import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:evently/core/utilities/routes/app_route_names.dart';
import 'package:evently/core/widgets/custom_action_button.dart';
import 'package:evently/modules/main_layout/models/category_model.dart';
import 'package:evently/modules/manage_event/manager/manage_event_provider.dart';
import 'package:evently/modules/manage_event/widgets/calender_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required this.event});
  final EventModel event ;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == .light;
    bool isEn = context.locale.languageCode == "en";
    bool isOwner = FirebaseAuth.instance.currentUser?.uid == event.ownerId;
    ManageEventProvider eventProvider = Provider.of<ManageEventProvider>(context) ;
    return Scaffold(
      appBar: AppBar(
        leading: CustomActionButton( 
          onTap: () => Navigator.pop(context) ,
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isLight ? AppColors.lightPrimaryColor : Colors.white,
            size: 24.sp , 
          ) ,
        ) ,
        title: Text(
          "event_details".tr(),
          style: AppFonts.medium18.copyWith(
            color: isLight ? AppColors.lightTextColor : AppColors.textColor,
          ),
        ),
        actions: [
          if( isOwner ) ...[
            CustomActionButton( 
                onTap: () => Navigator.pushNamed( context, AppRouteNames.manageEventScreen , arguments: event ) ,
                icon: SvgPicture.asset(
                  AppImages.editEvent , 
                  colorFilter: ColorFilter.mode(
                    isLight ? AppColors.lightPrimaryColor : AppColors.darkPrimaryColor , 
                    BlendMode.srcIn ,
                  ) ,
                  width: 24.sp ,
                  height: 24.sp ,
                ) ,
              ) ,
              CustomActionButton( 
                onTap: () => eventProvider.deleteEvent( context , event.eventId! )  ,
                icon: SvgPicture.asset(
                  AppImages.deleteEvent , 
                  colorFilter: ColorFilter.mode(
                    AppColors.red ,
                    BlendMode.srcIn ,
                  ) ,
                  width: 24.sp ,
                  height: 24.sp ,
                ) ,
              ) ,
              SizedBox(width: 10.w,) ,
          ]
        ]
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: isEn ? .start : .end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: AssetImage(
                    isLight
                        ? CategoryModel
                              .categoryMap[event.categoryId]!
                              .image
                        : CategoryModel
                              .categoryMap[event.categoryId]!
                              .darkImage
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text( // title
                event.title ,
                style: AppFonts.medium18.copyWith(
                  color: isLight
                      ? AppColors.lightTextColor
                      : AppColors.textColor,
                ),
              ),
              SizedBox(height: 16.h),
              CalenderCard( dateTime: event.dateTime ,) ,
              SizedBox(height: 16.h),
              Text( // description
                "description".tr() ,
                style: AppFonts.medium18.copyWith(
                  color: isLight
                      ? AppColors.lightTextColor
                      : AppColors.textColor,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: .infinity ,
                decoration: BoxDecoration(
                  color: isLight
                      ? AppColors.white
                      : AppColors.darkInputsColor,
                  borderRadius: BorderRadius.circular(16.r) ,
                  border: Border.all(
                    color: isLight
                        ? AppColors.disableColor 
                        : AppColors.darkStrokeColor ,
                    width: 1.5.w ,
                  ) ,
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Text(
                    event.description ,
                    style: AppFonts.regular14.copyWith(
                      color: isLight
                      ? AppColors.lightTextColor
                      : AppColors.textColor 
                    ) ,
                  ),
                ) ,
              ) ,
            ],
          ),
        ),
      ),
    );
  }
}
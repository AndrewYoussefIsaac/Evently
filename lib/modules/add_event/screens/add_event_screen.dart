import 'package:easy_localization/easy_localization.dart';
import 'package:evently/modules/add_event/manager/add_event_provider.dart';
import 'package:evently/modules/add_event/widgets/custom_choose_event_date_time.dart';
import 'package:evently/modules/add_event/widgets/custom_text_form_field.dart';
import 'package:evently/modules/auth/widgets/custom_back_button.dart';
import 'package:evently/modules/main_layout/models/category_model.dart';
import 'package:evently/modules/main_layout/widgets/custom_tabbar.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == .light;
    bool isEn = context.locale.languageCode == "en";
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text(
          "add_event".tr(),
          style: AppFonts.medium18.copyWith(
            color: isLight ? AppColors.lightTextColor : AppColors.textColor,
          ),
        ),
      ),
      body: DefaultTabController(
        length: CategoryModel.categories.length,
        child: Consumer<AddEventProvider>(
          builder:
          (
            BuildContext context,
            AddEventProvider provider,
            Widget? child,
          ) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Form(
                key: provider.formKey ,
                child: Column(
                  crossAxisAlignment: isEn ? .start : .end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image(
                        image: AssetImage(
                          isLight
                              ? CategoryModel
                                    .categories[provider.selectedTab]
                                    .image
                              : CategoryModel
                                    .categories[provider.selectedTab]
                                    .darkImage,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomTabbar(
                      showAll: false,
                      selectedTab: provider.selectedTab,
                      onTap: provider.updateSelectedTab,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "title".tr(),
                      style: AppFonts.medium16.copyWith(
                        color: isLight
                            ? AppColors.lightTextColor
                            : AppColors.textColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      label: "event_title".tr() ,
                      controller: provider.titleController ,
                      validator: (value) {
                        if (value != null && value.trim() != "") {
                          return null;
                        } else {
                          return "title_hint".tr() ;
                        }
                      },
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "description".tr(),
                      style: AppFonts.medium16.copyWith(
                        color: isLight
                            ? AppColors.lightTextColor
                            : AppColors.textColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 168.h,
                      child: CustomTextFormField(
                        label: "event_description".tr(),
                        controller:  provider.descriptionController ,
                        validator: (value) {
                          if (value != null && value.trim() != "") {
                            return null;
                          } else {
                            return "description_hint".tr() ;
                          }
                        },
                        expands: true,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomChooseEventDateTime(
                      image: AppImages.calendar,
                      title: "event_date",
                      onTap: () async {
                        DateTime? eventDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          currentDate: provider.eventDate,
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (eventDate != null) {
                          provider.updateEventDate(eventDate);
                        }
                      },
                      underlinedTitle: provider.eventDate == null
                          ? "choose_date"
                          : DateFormat(
                              'yyyy MMM dd',
                            ).format(provider.eventDate!),
                    ),
                    SizedBox(height: 16.h),
                    CustomChooseEventDateTime(
                      image: AppImages.clock,
                      title: "event_time",
                      onTap: () async {
                        TimeOfDay? eventTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (eventTime != null) {
                          provider.updateEventTime(eventTime);
                        }
                      },
                      underlinedTitle: provider.eventTime == null
                          ? "choose_time"
                          : provider.eventTime!.format(context),
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: CustomButton(
                        title: "add_event".tr(),
                        isLoading: provider.isLoading ,
                        onTap: () => provider.addEvent(context)
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

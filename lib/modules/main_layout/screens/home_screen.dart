import 'package:evently/core/utilities/routes/app_route_names.dart';
import 'package:evently/modules/main_layout/manager/layout_provider.dart';
import 'package:evently/modules/main_layout/models/category_model.dart';
import 'package:evently/modules/main_layout/widgets/custom_appbar.dart';
import 'package:evently/modules/main_layout/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: CategoryModel.categories.length + 1,
      child: Scaffold(
        appBar: CustomAppbar(),
        body: Consumer<LayoutProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              padding: .symmetric(vertical: 24.h, horizontal: 16.w),
              itemCount: provider.events.length,
              itemBuilder: (context, index) =>
                  EventCard(
                    event: provider.events[index], 
                    onTap: () async {
                      var isDeleted = await Navigator.pushNamed( context , AppRouteNames.eventDetailsScreen , arguments: provider.events[index]  ) ; 
                      if ( isDeleted == true ){
                        provider.getEvents() ;
                      }
                    }
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
            );
          },
        ),
      ),
    );
  }
}

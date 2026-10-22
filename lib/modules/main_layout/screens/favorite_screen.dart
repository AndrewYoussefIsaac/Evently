import 'package:evently/core/models/event_model.dart';
import 'package:evently/modules/main_layout/services/layout_service.dart';
import 'package:evently/modules/main_layout/widgets/custom_search_field.dart';
import 'package:evently/modules/main_layout/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              CustomSearchField(
                controller: controller,
                onChanged: (_) {
                  setState(() {});
                },
              ),
              SizedBox(height: 24.h),
              StreamBuilder(
                stream: LayoutService.getFavorite(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    List<EventModel> favEvents = [];
                    List<EventModel> searchedEvents = favEvents;
                    var data = snapshot.data?.docs;
                    for (var element in data!) {        /// convert raw data to our event model
                      favEvents.add(EventModel.fromJson(element.data()));
                    }
                    searchedEvents = favEvents
                        .where(
                          (element) => element.title.toLowerCase().contains(
                            controller.text.toLowerCase().trim(),
                          ),
                        )
                        .toList();
                    return Expanded(
                      child: ListView.separated(
                        itemCount: searchedEvents.length,
                        itemBuilder: (context, index) =>
                            EventCard(event: searchedEvents[index]),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

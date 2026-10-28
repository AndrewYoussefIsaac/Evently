import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/toast.dart';
import 'package:evently/modules/manage_event/services/manage_event_service.dart';
import 'package:evently/modules/main_layout/models/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddEventProvider extends ChangeNotifier {
  // tabs 
  int selectedTab = 0 ; // initially 
  void updateSelectedTab ( int index ) {
    selectedTab = index ; 
    notifyListeners() ;
  }
  
  // (title && description) controllers , form key 
  TextEditingController titleController =TextEditingController() ;
  TextEditingController descriptionController =TextEditingController() ;
  GlobalKey<FormState> formKey = GlobalKey() ;


  // event date 
  DateTime? eventDate ; // initially null
  void updateEventDate ( DateTime newDate ) {
    eventDate = newDate ;
    notifyListeners() ;
  }

  // event time 
  TimeOfDay? eventTime ; // initially null
  void updateEventTime ( TimeOfDay newTime ) {
    eventTime = newTime ;
    notifyListeners() ;
  }


  bool isLoading = false ; // initially ( default state )


  Future<void> addEvent ( BuildContext context ) async {

    ManageEventService addEventService = ManageEventService() ;

    // final dateTime to deal with firestore 
    DateTime? dateTime = (eventDate != null && eventTime != null) 
        ? DateTime(
            eventDate!.year ,
            eventDate!.month ,
            eventDate!.day ,
            eventTime!.hour ,
            eventTime!.minute ,
          )
        : null ;
    
    isLoading = true ;
    notifyListeners() ;
    try {
      if (formKey.currentState?.validate() == false ){
        isLoading = false ;
        notifyListeners() ;
        return ;
      } else if ( eventDate == null ) {
        Toast.showToast( title: "date_hint".tr() , context: context) ;
        isLoading = false ;
        notifyListeners() ;
        return ;
      } else if ( eventTime == null ) {
        Toast.showToast( title: "time_hint".tr() , context: context) ;
        isLoading = false ;
        notifyListeners() ;
        return ;
      }
      await addEventService.addEvent( 
        EventModel(
          categoryId: CategoryModel.categories[selectedTab].id  , 
          ownerId: FirebaseAuth.instance.currentUser!.uid ,
          title: titleController.text , 
          description: descriptionController.text , 
          dateTime: dateTime! ,
        )
      ) ;
      if (context.mounted) {
        Toast.showToast( title: "event_success_create".tr() , color: AppColors.green , context: context) ;
        await Future.delayed( Duration(milliseconds: 500 ) ) ;
        if ( context.mounted ) {
          Navigator.pop(context) ;  
        }
      }
    } catch (e) {
      if (context.mounted) {
        Toast.showToast( title: 'event_fail_create'.tr() , context: context) ;
      }
    }
    isLoading = false ;
    notifyListeners() ;
  }



}
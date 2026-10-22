import 'package:evently/core/models/event_model.dart';
import 'package:evently/modules/main_layout/services/layout_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LayoutProvider extends ChangeNotifier {

  LayoutProvider(){    // a constructor of provider to execute functions initially once it's formed
    getEvents() ;
  }

  // tabs 
  int selectedTab = 0 ;
  void updateSelectedTab ( int index ) {
    selectedTab = index ; 
    notifyListeners() ;
    getEvents() ;
  }

  // bottomnavigationbar 
  int currentScreen = 0 ;
  void updateSelectedScreen ( int index ) {
    currentScreen = index ; 
    notifyListeners() ;
  }

  // events 
  List<EventModel> events = [] ;
  void getEvents () async {
    events = await LayoutService.getEvents( selectedTab ) ;
    notifyListeners() ;
  }

  // favorites 
  void updateFavorite ( String eventId ) {
    bool isFavorite ;
    EventModel? event ;
    final String userId = FirebaseAuth.instance.currentUser!.uid ;
    for (var element in events ) {
      if ( element.eventId == eventId ){
        event = element ;
        isFavorite = event.favUsers.contains(userId) ? true : false ;
        LayoutService.updateFavorites( eventId, isFavorite) ;  // to update the actuall events in firebase 
        if ( element.favUsers.contains( userId ) ){
          element.favUsers.remove(userId) ;
        }else{
          element.favUsers.add(userId) ;
        }
        break ;
      }
    }
    notifyListeners() ;
  }


}
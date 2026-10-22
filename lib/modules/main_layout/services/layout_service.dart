import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/modules/main_layout/models/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LayoutService {
  
  static Future<List<EventModel>> getEvents ( int selectedTab ) async {
    List<EventModel> events = [] ; // must give it empty initial val [ ]
    var rawData = await FirebaseFirestore.instance.collection('events').get();
    for (var element in rawData.docs ) {
      if ( selectedTab == 0 ){
        events.add( EventModel.fromJson( element.data() ) ) ; // don't forget ( .data() ) 
      } 
      else {
        EventModel model = EventModel.fromJson( element.data() ) ; 
        if ( model.categoryId == CategoryModel.categories[selectedTab-1].id ) {
          events.add( model ) ;
        }
      }
    }
    return events ;
  }

  static Future<void> updateFavorites ( String eventId , bool isFavorite ) async {
    final String userId = FirebaseAuth.instance.currentUser!.uid ;
    var docRef = FirebaseFirestore.instance.collection('events').doc(eventId) ;
    if ( isFavorite ) {
      await docRef.update({ "fav_users" : FieldValue.arrayRemove([userId]) }) ;
    }
    else{
      await docRef.update({ "fav_users" : FieldValue.arrayUnion([userId]) }) ;
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getFavorite (){
    return FirebaseFirestore.instance
      .collection("events")
      .where("fav_users", arrayContains: FirebaseAuth.instance.currentUser!.uid ) 
      .snapshots();
  }
}
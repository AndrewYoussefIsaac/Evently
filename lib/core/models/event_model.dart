import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {

  String? eventId ;             // to help (modify/delete) the event 
  final String ownerId ;        // to control who can edit the event 
  final String categoryId ;
  final String title ;
  final String description ;
  final DateTime dateTime ;
  List<String> favUsers ;       // to control the fav button appearence and favorite page filteration

  EventModel({
    this.eventId ,
    required this.ownerId   ,
    required this.categoryId ,
    required this.title ,
    required this.description ,
    required this.dateTime, 
    this.favUsers = const [] 
  }) ;

  Map<String,dynamic> toJson (){
    return {
      "event_id" : eventId ,
      "owner_id" : ownerId ,
      "category_id" : categoryId ,
      "title" : title ,
      "description" : description ,
      "date_time" : dateTime ,
      "fav_users" : favUsers ,
    } ;
  }

  factory EventModel.fromJson ( Map<String,dynamic> json ){
    return EventModel(
      eventId: json["event_id"] ,
      ownerId: json["owner_id"] , 
      categoryId: json["category_id"] , 
      title: json["title"] , 
      description: json["description"] , 
      dateTime: (json["date_time"] as Timestamp ).toDate() , // don't forget to convert timeStamp into DateTime
      favUsers: ( json["fav_users"] ?? [] ).map<String>( (e) => e.toString() ).toList()  , // any list returned by firebase is of type list<dynamic> so map it into list<wanted_dt>
    ) ;
  }

}

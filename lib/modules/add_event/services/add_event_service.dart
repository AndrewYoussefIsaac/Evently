import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/event_model.dart';

class AddEventService {
  Future<void> addEvent(EventModel event) async {
    var docRef = FirebaseFirestore.instance.collection('events').doc(); // create empty document in the collection to get the document id
    event.eventId = docRef.id; // give document id to model
    await docRef.set(event.toJson()); // fill document with model's data 
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_8/core/model/eventModel.dart';

class Firbase {
  static CollectionReference<Eventmodel> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(Eventmodel.colllectionEvent)
        .withConverter<Eventmodel>(
            fromFirestore: (snapshot, _) =>
                Eventmodel.fromFireStore(snapshot.data()!),
            toFirestore: (event, _) => event.toFireStore());
  }

  static Future<void> addEeventToFirstor(Eventmodel event) {
    var collectionRef = getEventCollection();
    var docRef = collectionRef.doc();
    event.id = docRef.id;
    return docRef.set(event);
  }
  static Future<void> UpdateEventToFirStor(Eventmodel event) {
  if (event.id.isEmpty) {
    throw Exception("Event ID cannot be empty for an update.");
  }

  var collectionRef = getEventCollection();
  var docRef = collectionRef.doc(event.id); 

  return docRef.set(event, SetOptions(merge: true)); 
}

}

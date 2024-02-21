import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/event.dart';

class EventRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addEvent(Event event) async {
    await _firestore.collection('events').doc(event.id).set(event.toMap());
  }

  Future<Event?> getEventById(String eventId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('events').doc(eventId).get();
    if (snapshot.exists) {
      return Event.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }

  Future<List<Event>> getEventsForOrganizer(String organizerId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('events')
        .where('organizerId', isEqualTo: organizerId)
        .orderBy('eventDateTime', descending: true)
        .get();

    return querySnapshot.docs.map((doc) => Event.fromSnapshot(doc)).toList();
  }

  Future<void> updateEvent(Event event) async {
    await _firestore.collection('events').doc(event.id).update(event.toMap());
  }

  Future<void> deleteEvent(String eventId) async {
    await _firestore.collection('events').doc(eventId).delete();
  }
}

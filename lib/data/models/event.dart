import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String? id;
  late String organizerId; // User ID of the event organizer
  late String eventName;
  late String description;
  late String location;
  DateTime? eventDateTime;
  bool isFree;
  int? maxParticipants;
  List<String>? participantIds;

  Event({
    this.id,
    required this.organizerId,
    required this.eventName,
    required this.description,
    required this.location,
    this.eventDateTime,
    required this.isFree,
    this.maxParticipants,
    this.participantIds,
  });

  factory Event.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Event(
      id: snapshot.id,
      organizerId: data['organizerId'],
      eventName: data['eventName'],
      description: data['description'],
      location: data['location'],
      eventDateTime: (data['eventDateTime'] as Timestamp?)?.toDate(),
      isFree: data['isFree'],
      maxParticipants: data['maxParticipants'],
      participantIds: List<String>.from(data['participantIds'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'organizerId': organizerId,
      'eventName': eventName,
      'description': description,
      'location': location,
      'eventDateTime': eventDateTime,
      'isFree': isFree,
      'maxParticipants': maxParticipants,
      'participantIds': participantIds,
    };
  }
}

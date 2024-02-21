import 'package:cloud_firestore/cloud_firestore.dart';

class SkillRequest {
  String? id;
  late String userId; // Assuming this is the user's ID making the request
  late String skillName;
  late String skillDescription;
  late String desiredSkillLevel;
  String? additionalDetails;
  DateTime? requestDateTime;
  bool isFulfilled;

  SkillRequest({
    this.id,
    required this.userId,
    required this.skillName,
    required this.skillDescription,
    required this.desiredSkillLevel,
    this.additionalDetails,
    this.requestDateTime,
    required this.isFulfilled,
  });

  factory SkillRequest.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return SkillRequest(
      id: snapshot.id,
      userId: data['userId'],
      skillName: data['skillName'],
      skillDescription: data['skillDescription'],
      desiredSkillLevel: data['desiredSkillLevel'],
      additionalDetails: data['additionalDetails'],
      requestDateTime: (data['requestDateTime'] as Timestamp?)?.toDate(),
      isFulfilled: data['isFulfilled'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'skillName': skillName,
      'skillDescription': skillDescription,
      'desiredSkillLevel': desiredSkillLevel,
      'additionalDetails': additionalDetails,
      'requestDateTime': requestDateTime,
      'isFulfilled': isFulfilled,
    };
  }
}

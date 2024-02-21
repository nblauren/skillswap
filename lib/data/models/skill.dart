import 'package:cloud_firestore/cloud_firestore.dart';

class Skill {
  String? id;
  late String userId; // Assuming this is the user's ID who owns the skill
  late String skillName;
  late String skillDescription;
  late String skillLevel;
  late List<String> availability;
  late bool isPaid;
  String? category;

  Skill({
    this.id,
    required this.userId,
    required this.skillName,
    required this.skillDescription,
    required this.skillLevel,
    required this.availability,
    required this.isPaid,
    this.category,
  });

  factory Skill.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Skill(
      id: snapshot.id,
      userId: data['userId'],
      skillName: data['skillName'],
      skillDescription: data['skillDescription'],
      skillLevel: data['skillLevel'],
      availability: List<String>.from(data['availability']),
      isPaid: data['isPaid'],
      category: data['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'skillName': skillName,
      'skillDescription': skillDescription,
      'skillLevel': skillLevel,
      'availability': availability,
      'isPaid': isPaid,
      'category': category,
    };
  }
}

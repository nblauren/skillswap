import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  String? id;
  late String userId; // User ID who added the skill to favorites
  late String skillId; // ID of the skill added to favorites

  Favorite({
    this.id,
    required this.userId,
    required this.skillId,
  });

  factory Favorite.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Favorite(
      id: snapshot.id,
      userId: data['userId'],
      skillId: data['skillId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'skillId': skillId,
    };
  }
}

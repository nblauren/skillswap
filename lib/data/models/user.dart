import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String firebaseUid;
  String? profilePicture;
  String? street;
  String? city;
  String? state;
  String? country;
  String? location;
  int? skillPoints;
  Map<String, dynamic>? paymentInformation;

  User({
    required this.id,
    required this.firebaseUid,
    this.profilePicture,
    this.location,
    this.skillPoints,
    this.paymentInformation,
  });

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return User(
      id: snapshot.id,
      firebaseUid: data['firebaseUid'],
      profilePicture: data['profilePicture'],
      location: data['location'],
      skillPoints: data['skillPoints'],
      paymentInformation: data['paymentInformation'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firebaseUid': firebaseUid,
      'profilePicture': profilePicture,
      'location': location,
      'skillPoints': skillPoints,
      'paymentInformation': paymentInformation,
    };
  }
}

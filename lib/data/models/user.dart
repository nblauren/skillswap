import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? id;
  late String username;
  late String email;
  late String password;
  String? profilePicture;
  String? location;
  int? skillPoints;
  Map<String, dynamic>? paymentInformation;

  User({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    this.profilePicture,
    this.location,
    this.skillPoints,
    this.paymentInformation,
  });

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return User(
      id: snapshot.id,
      username: data['username'],
      email: data['email'],
      password: data['password'],
      profilePicture: data['profilePicture'],
      location: data['location'],
      skillPoints: data['skillPoints'],
      paymentInformation: data['paymentInformation'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
      'location': location,
      'skillPoints': skillPoints,
      'paymentInformation': paymentInformation,
    };
  }
}

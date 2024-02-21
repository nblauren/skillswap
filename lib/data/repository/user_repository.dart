import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/user.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(User user) async {
    await _firestore.collection('users').doc(user.id).set(user.toMap());
  }

  Future<User?> getUserById(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('users').doc(userId).get();
    if (snapshot.exists) {
      return User.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }

  Future<void> updateUser(User user) async {
    await _firestore.collection('users').doc(user.id).update(user.toMap());
  }

  Future<void> deleteUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }
}

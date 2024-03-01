import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/user.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(User user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toMap());
    } catch (e) {
      print('Error adding user: $e');
      throw e;
    }
  }

  Future<User?> getUserById(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(userId).get();
      if (snapshot.exists) {
        return User.fromSnapshot(snapshot);
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting user by id: $e');
      throw e;
    }
  }

  Future<User?> getUserByFirebaseUid(String firebaseUid) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .where('firebaseUid', isEqualTo: firebaseUid)
          .get();
      if (snapshot.docs.isNotEmpty) {
        return User.fromSnapshot(snapshot.docs.first);
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting user by Firebase UID: $e');
      throw e;
    }
  }

  Future<void> updateUser(User user) async {
    try {
      await _firestore.collection('users').doc(user.id).update(user.toMap());
    } catch (e) {
      print('Error updating user: $e');
      throw e;
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      print('Error deleting user: $e');
      throw e;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/notification.dart';

class NotificationRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNotification(NotificationModel notification) async {
    await _firestore
        .collection('notifications')
        .doc(notification.id)
        .set(notification.toMap());
  }

  Future<NotificationModel?> getNotificationById(String notificationId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('notifications').doc(notificationId).get();
    if (snapshot.exists) {
      return NotificationModel.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }

  Future<List<NotificationModel>> getNotificationsForUser(String userId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('notifications')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get();

    return querySnapshot.docs
        .map((doc) => NotificationModel.fromSnapshot(doc))
        .toList();
  }

  Future<void> updateNotification(NotificationModel notification) async {
    await _firestore
        .collection('notifications')
        .doc(notification.id)
        .update(notification.toMap());
  }

  Future<void> deleteNotification(String notificationId) async {
    await _firestore.collection('notifications').doc(notificationId).delete();
  }
}

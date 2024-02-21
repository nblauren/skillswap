import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  String? id;
  late String userId; // User ID who should receive the notification
  late String content;
  DateTime? timestamp;
  bool isRead;

  NotificationModel({
    this.id,
    required this.userId,
    required this.content,
    this.timestamp,
    required this.isRead,
  });

  factory NotificationModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return NotificationModel(
      id: snapshot.id,
      userId: data['userId'],
      content: data['content'],
      timestamp: (data['timestamp'] as Timestamp?)?.toDate(),
      isRead: data['isRead'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'content': content,
      'timestamp': timestamp,
      'isRead': isRead,
    };
  }
}

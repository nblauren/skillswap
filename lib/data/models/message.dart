import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? id;
  late String senderId; // User ID of the sender
  late String receiverId; // User ID of the receiver
  late String content;
  DateTime? timestamp;

  Message({
    this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    this.timestamp,
  });

  factory Message.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Message(
      id: snapshot.id,
      senderId: data['senderId'],
      receiverId: data['receiverId'],
      content: data['content'],
      timestamp: (data['timestamp'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'timestamp': timestamp,
    };
  }
}

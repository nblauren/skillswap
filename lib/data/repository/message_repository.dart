import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/message.dart';

class MessageRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addMessage(Message message) async {
    await _firestore
        .collection('messages')
        .doc(message.id)
        .set(message.toMap());
  }

  Future<Message?> getMessageById(String messageId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('messages').doc(messageId).get();
    if (snapshot.exists) {
      return Message.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }

  Future<List<Message>> getMessagesForUser(String userId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('messages')
        .where('senderId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get();

    return querySnapshot.docs.map((doc) => Message.fromSnapshot(doc)).toList();
  }

  Future<void> updateMessage(Message message) async {
    await _firestore
        .collection('messages')
        .doc(message.id)
        .update(message.toMap());
  }

  Future<void> deleteMessage(String messageId) async {
    await _firestore.collection('messages').doc(messageId).delete();
  }
}

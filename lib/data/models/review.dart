import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  String? id;
  late String reviewerId; // User ID of the reviewer
  late String reviewedUserId; // User ID of the user being reviewed
  late int rating;
  late String content;
  DateTime? reviewDateTime;

  Review({
    this.id,
    required this.reviewerId,
    required this.reviewedUserId,
    required this.rating,
    required this.content,
    this.reviewDateTime,
  });

  factory Review.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Review(
      id: snapshot.id,
      reviewerId: data['reviewerId'],
      reviewedUserId: data['reviewedUserId'],
      rating: data['rating'],
      content: data['content'],
      reviewDateTime: (data['reviewDateTime'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reviewerId': reviewerId,
      'reviewedUserId': reviewedUserId,
      'rating': rating,
      'content': content,
      'reviewDateTime': reviewDateTime,
    };
  }
}

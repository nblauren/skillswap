import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/review.dart';

class ReviewRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addReview(Review review) async {
    await _firestore.collection('reviews').doc(review.id).set(review.toMap());
  }

  Future<Review?> getReviewById(String reviewId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('reviews').doc(reviewId).get();
    if (snapshot.exists) {
      return Review.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }

  Future<List<Review>> getReviewsForUser(String userId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('reviews')
        .where('reviewedUserId', isEqualTo: userId)
        .orderBy('reviewDateTime', descending: true)
        .get();

    return querySnapshot.docs.map((doc) => Review.fromSnapshot(doc)).toList();
  }

  Future<void> updateReview(Review review) async {
    await _firestore
        .collection('reviews')
        .doc(review.id)
        .update(review.toMap());
  }

  Future<void> deleteReview(String reviewId) async {
    await _firestore.collection('reviews').doc(reviewId).delete();
  }
}

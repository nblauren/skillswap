import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/favorite.dart';

class FavoriteRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addFavorite(Favorite favorite) async {
    await _firestore
        .collection('favorites')
        .doc(favorite.id)
        .set(favorite.toMap());
  }

  Future<Favorite?> getFavoriteById(String favoriteId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('favorites').doc(favoriteId).get();
    if (snapshot.exists) {
      return Favorite.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }

  Future<List<Favorite>> getFavoritesForUser(String userId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('favorites')
        .where('userId', isEqualTo: userId)
        .get();

    return querySnapshot.docs.map((doc) => Favorite.fromSnapshot(doc)).toList();
  }

  Future<void> updateFavorite(Favorite favorite) async {
    await _firestore
        .collection('favorites')
        .doc(favorite.id)
        .update(favorite.toMap());
  }

  Future<void> deleteFavorite(String favoriteId) async {
    await _firestore.collection('favorites').doc(favoriteId).delete();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/skill_request.dart';

class SkillRequestRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addSkillRequest(SkillRequest skillRequest) async {
    await _firestore
        .collection('skillRequests')
        .doc(skillRequest.id)
        .set(skillRequest.toMap());
  }

  Future<SkillRequest?> getSkillRequestById(String skillRequestId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('skillRequests').doc(skillRequestId).get();
    if (snapshot.exists) {
      return SkillRequest.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }

  Future<void> updateSkillRequest(SkillRequest skillRequest) async {
    await _firestore
        .collection('skillRequests')
        .doc(skillRequest.id)
        .update(skillRequest.toMap());
  }

  Future<void> deleteSkillRequest(String skillRequestId) async {
    await _firestore.collection('skillRequests').doc(skillRequestId).delete();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/skill.dart';

class SkillRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addSkill(Skill skill) async {
    await _firestore.collection('skills').doc(skill.id).set(skill.toMap());
  }

  Future<Skill?> getSkillById(String skillId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('skills').doc(skillId).get();
    if (snapshot.exists) {
      return Skill.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }

  Future<void> updateSkill(Skill skill) async {
    await _firestore.collection('skills').doc(skill.id).update(skill.toMap());
  }

  Future<void> deleteSkill(String skillId) async {
    await _firestore.collection('skills').doc(skillId).delete();
  }
}

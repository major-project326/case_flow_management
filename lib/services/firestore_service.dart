import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addCase(String caseId, Map<String, dynamic> caseData) async {
    await _db.collection("cases").doc(caseId).set(caseData);
  }

  Future<DocumentSnapshot> getCase(String caseId) async {
    return await _db.collection("cases").doc(caseId).get();
  }

  Future<void> updateCase(
      String caseId, Map<String, dynamic> updatedData) async {
    await _db.collection("cases").doc(caseId).update(updatedData);
  }

  Future<void> deleteCase(String caseId) async {
    await _db.collection("cases").doc(caseId).delete();
  }
}

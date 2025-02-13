import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addCase(Map<String, dynamic> caseData) async {
    await _db.collection("cases").add(caseData);
  }

  Future<QuerySnapshot> getAllCases() async {
    return await _db
        .collection("cases")
        .orderBy("priority", descending: true)
        .get();
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

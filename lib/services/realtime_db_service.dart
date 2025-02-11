import 'package:firebase_database/firebase_database.dart';

class RealtimeDBService {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  Future<void> addUser(String userId, Map<String, dynamic> userData) async {
    await _db.child("users").child(userId).set(userData);
  }

  Future<DataSnapshot> getUser(String userId) async {
    return await _db.child("users").child(userId).get();
  }
}

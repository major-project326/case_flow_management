import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      // Handling different Firebase errors
      switch (e.code) {
        case 'invalid-email':
          errorMessage = "The email format is incorrect.";
          break;
        case 'user-disabled':
          errorMessage = "This user account has been disabled.";
          break;
        case 'user-not-found':
          errorMessage = "No user found with this email.";
          break;
        case 'wrong-password':
          errorMessage = "Incorrect password. Please try again.";
          break;
        default:
          errorMessage = "Login failed. Please try again.";
      }

      print("Sign-in error: $errorMessage");
      throw errorMessage; // Throwing error so UI can catch it
    } catch (e) {
      print("Unexpected error: $e");
      throw "An unexpected error occurred. Please try again.";
    }
  }

  Future<User?> signUpWithEmail({
    required String name,
    required String phone,
    required String idNumber,
    required String email,
    required String password,
  }) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Store additional user details in Realtime Database
        await _dbRef.child("users").child(user.uid).set({
          "name": name,
          "phone": phone,
          "idNumber": idNumber,
          "email": email,
          "createdAt": DateTime.now().toIso8601String(),
        });

        return user;
      }
    } catch (e) {
      print("Sign-up error: $e");
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}

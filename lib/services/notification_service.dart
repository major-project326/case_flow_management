import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> requestPermission() async {
    NotificationSettings settings = await _fcm.requestPermission();
    print("User granted permission: ${settings.authorizationStatus}");
  }

  Future<String?> getToken() async {
    return await _fcm.getToken();
  }
}

import 'package:firebase_core/firebase_core.dart';
import '../my_firebase_messaging.dart';
import 'firebase_options.dart';

void initFirebaseApp() async {
  // Firebase 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Firebase Cloud Messaging 초기화
  await MyFirebaseMessagingManager.instance.init();
}

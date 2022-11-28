import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';
import 'package:si_hicoach_fe/infrastructure/firebase/local_notification_manager.dart';

class MyFirebaseMessagingManager {
  MyFirebaseMessagingManager._privateConstructor();

  static final MyFirebaseMessagingManager instance =
      MyFirebaseMessagingManager._privateConstructor();

  final _localNotificationsManager = LocalNotificationsManager.instance;

  Future<void> init() async {
    _initMessaging();

    Logger().i("FCM TOKEN : ${await getFcmToken()}");
  }

  Future<void> _initMessaging() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // 권한 요청
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // 포그라운드 핸들러 등록
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // 백그라운드 핸들러 등록
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  }

  // 포그라운드 메시지 감지시 핸들링
  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    if (message.notification != null) _localNotificationsManager.show(message);
  }

  // FCM 토큰 가져오기
  Future<String?> getFcmToken() async {
    return await FirebaseMessaging.instance.getToken();
  }
}

// 백그라운드 메시지 감지시 핸들링
Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
}

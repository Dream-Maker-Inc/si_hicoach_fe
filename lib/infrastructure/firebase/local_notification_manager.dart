import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// 안드로이드 채널 설정
var _androidChannel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // name
  description: 'This channel is used for important notifications.',
  // description
  importance: Importance.high,
);

// 로컬 푸시 플러그인 초기 설정
const InitializationSettings initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: DarwinInitializationSettings());

//
class LocalNotificationsManager {
  LocalNotificationsManager._privateConstructor() {
    _init();
  }

  static final LocalNotificationsManager instance =
      LocalNotificationsManager._privateConstructor();

  final _notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> _init() async {
    // 로컬 푸시 플러그인 설정 세팅
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);

    // foreground 메시지 클릭 핸들러 등록
    await _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: _handleForegroundMessageClick);

    // background 메시지 클릭 핸들러 등록
    await _setupInteractedMessage();
  }

  // background 메시지 클릭 핸들러 세팅
  Future<void> _setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // 앱 종료상태에서 클릭한 푸시 알림 메세지 핸들링
    if (initialMessage != null) _handleBackgroundMessageClick(initialMessage);

    // 앱이 백그라운드 상태에서 푸시 알림 클릭 하여 열릴 경우 메세지 스트림을 통해 처리
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessageClick);
  }

  // foreground 메시지 클릭 핸들링
  _handleForegroundMessageClick(NotificationResponse payload) {
    // if (payload != null) {
    //   Get.to(const NextPage(), arguments: payload);
    // }
  }

  // background 메시지 클릭 핸들링
  _handleBackgroundMessageClick(RemoteMessage message) {
    // if (message.data['type'] == 'chat') {
    //   Get.toNamed('/chat', arguments: message.data);
    // }
  }

  // 메시지를 디바이스로 뿌려주기
  show(RemoteMessage message) async {
    final detail = NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(
          badgeNumber: 1,
          subtitle: 'the subtitle',
          sound: 'slow_spring_board.aiff',
        ));

    _notificationsPlugin.show(message.hashCode, message.notification?.title,
        message.notification?.body, detail);
  }
}

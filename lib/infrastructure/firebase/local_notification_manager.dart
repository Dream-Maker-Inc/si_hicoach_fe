import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// 안드로이드 채널 설정
const _androidChannel = AndroidNotificationChannel(
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

/// 로컬 푸시 기능 관리 클래스
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

    // 앱 종료 상태에서 클릭한 푸시 알림 메세지 핸들링
    if (initialMessage != null) _handleBackgroundMessageClick(initialMessage);

    // 앱이 백그라운드 상태에서 푸시 알림 클릭되어 열릴 때, 메세지 스트림을 통해 처리
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessageClick);
  }

  // foreground 메시지 클릭 핸들링
  _handleForegroundMessageClick(NotificationResponse payload) {
    // 포그라운드 메시지 클릭시 동작이 있는 경우 작성
  }

  // background 메시지 클릭 핸들링
  _handleBackgroundMessageClick(RemoteMessage message) {
    // 백그라운드 메시지 클릭시 동작이 있는 경우 작성
  }

  // 메시지를 디바이스로 뿌려주기
  show(RemoteMessage message) async {
    final androidNotiDetails = AndroidNotificationDetails(
      _androidChannel.id,
      _androidChannel.name,
      channelDescription: _androidChannel.description,
      icon: '@mipmap/ic_launcher',
    );

    const iosNotiDetails = DarwinNotificationDetails(
      badgeNumber: 1,
      subtitle: 'the subtitle',
      sound: 'slow_spring_board.aiff',
    );

    final detail =
        NotificationDetails(android: androidNotiDetails, iOS: iosNotiDetails);

    // 뿌리기
    _notificationsPlugin.show(message.hashCode, message.notification?.title,
        message.notification?.body, detail);
  }
}

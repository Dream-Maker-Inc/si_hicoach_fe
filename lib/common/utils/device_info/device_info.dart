// 디바이스 정보 가져오기
import 'dart:io';

import 'package:si_hicoach_fe/common/utils/device_info/device_info_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:si_hicoach_fe/infrastructure/firebase/my_firebase_messaging.dart';

Future<DeviceInfo?> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    var fcmToken = await getFcmToken();
    return DeviceInfo(
        androidInfo.id ?? "", androidInfo.model ?? "", fcmToken ?? "");
  }

  if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    var fcmToken = await getFcmToken();
    return DeviceInfo(
        iosInfo.identifierForVendor ?? "", iosInfo.model ?? "", fcmToken ?? "");
  }

  return null;
}

// FCM 토큰 가져오기
Future<String?> getFcmToken() async {
  var fcmToken = await MyFirebaseMessagingManager.instance.getFcmToken();
  return fcmToken;
}

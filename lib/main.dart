import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:si_hicoach_fe/common/theme/checkbox.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(
    nativeAppKey: '2eb9e8254d61ad9e92ffb9fc808f6fd6',
    javaScriptAppKey: 'fb7bda6af1c20a1dd95ff62923541e00',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetMaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme,
          checkboxTheme: checkboxThemes,
          scaffoldBackgroundColor: Colors.white,
        ),
        themeMode: ThemeMode.light,
        home: const SplashPage(),
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}

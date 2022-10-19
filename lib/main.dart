import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/checkbox_themes.dart';
import 'package:si_hicoach_fe/common/color_schemes.dart';
import 'package:si_hicoach_fe/common/text_styles.dart';
import 'package:si_hicoach_fe/pages/login/login.dart';
import 'package:si_hicoach_fe/pages/sign_up/sign_up_agreement.dart';
import 'package:si_hicoach_fe/pages/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          textTheme: textStyle,
          colorScheme: colorScheme,
          checkboxTheme: checkboxThemes,
          scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1)),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => const LoginPage(),
        '/sign_up': (BuildContext context) => const SignUpAgreementPage(),
      },
      home: SplashPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:si_hicoach_fe/common/checkbox_themes.dart';
import 'package:si_hicoach_fe/common/color_schemes.dart';
import 'package:si_hicoach_fe/common/text_styles.dart';
import 'package:si_hicoach_fe/pages/login/login.dart';
import 'package:si_hicoach_fe/pages/sign_up/agreement/agreement.dart';
import 'package:si_hicoach_fe/pages/sign_up/information/information.dart';
import 'package:si_hicoach_fe/pages/sign_up/type/type.dart';
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
        scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => const LoginPage(),
        '/sign_up/agreement': (BuildContext context) =>
            const SignUpAgreementPage(),
        '/sign_up/type': (BuildContext context) => const SignUpTypePage(),
        '/sign_up/information': (BuildContext context) =>
            const SignUpInformationPage(),
      },
      home: const SplashPage(),
    );
  }
}

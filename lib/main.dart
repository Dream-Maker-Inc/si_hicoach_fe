import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/themes/custom_theme.dart';
import 'package:si_hicoach_fe/domain/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialApp(
        theme: customTheme,
        home: const SplashPage(),
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}

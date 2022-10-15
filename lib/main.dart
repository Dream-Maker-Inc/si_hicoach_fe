import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/color_schemes.dart';
import 'package:si_hicoach_fe/common/text_styles.dart';
import 'package:si_hicoach_fe/pages/login/login.dart';

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
      ),
      home: LoginPage(),
    );
  }
}

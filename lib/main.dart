import 'package:flutter/material.dart';
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
          brightness: Brightness.light,
          primaryColor: Colors.indigo,
          textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              headline2: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              headline3: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              caption: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              overline: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.indigo,
              ))),
      home: LoginPage(),
    );
  }
}

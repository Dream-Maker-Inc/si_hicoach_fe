import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/checkbox.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
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
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme,
          checkboxTheme: checkboxThemes,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const SplashPage(),
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/checkbox_themes.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/text_styles.dart';
import 'package:si_hicoach_fe/domain/member/find/tab.dart';

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
          brightness: Brightness.light,
          textTheme: textStyle,
          colorScheme: colorScheme,
          checkboxTheme: checkboxThemes,
          scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        ),
        home: const MemberFindTabView(),
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}

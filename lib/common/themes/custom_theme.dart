import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/checkbox.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/common/theme/text.dart';

ThemeData customTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: textStyle,
  colorScheme: colorScheme,
  checkboxTheme: checkboxThemes,
  scaffoldBackgroundColor: Colors.white,
);
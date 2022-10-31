import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

TextStyle appBarTextStyle = const TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 20,
);

TabBarTheme tabBarTheme = TabBarTheme(
  labelColor: colorScheme.primary,
  unselectedLabelColor: Colors.black,
  labelStyle: appBarTextStyle,
  unselectedLabelStyle: appBarTextStyle,
);

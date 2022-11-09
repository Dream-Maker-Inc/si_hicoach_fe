import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

TextStyle appBarTextStyle = const TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 20,
);

TabBarTheme tabBarTheme = TabBarTheme(
  labelColor: primaryColor,
  unselectedLabelColor: Colors.black,
  labelStyle: appBarTextStyle,
  unselectedLabelStyle: appBarTextStyle,
);

import 'package:flutter/material.dart';

ColorScheme colorScheme = ColorScheme(
  primary: primaryColor,
  onPrimary: Colors.white,
  secondary: const Color(0x104667F0),
  onSecondary: Colors.white,
  background: const Color(0xff4667F0),
  onBackground: Colors.white,
  surface: Colors.white,
  onSurface: Colors.black,
  error: Colors.white,
  onError: Colors.red,
  brightness: Brightness.light,

  // 스크롤 시 AppBar Background 를 고정해야 하기 때문에 필요
  surfaceTint: Colors.white,
);

Color primaryColor = const Color(0xff4667f0);
Color secondaryColor = const Color(0x104667f0);

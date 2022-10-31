import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

TextTheme textStyle = TextTheme(
  headline1: const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  ),
  headline2: const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.normal,
  ),
  headline3: const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  headline4: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.grey,
  ),
  headline5: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: colorScheme.primary,
  ),
  labelMedium: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Colors.grey,
  ),
  button: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
  overline: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: colorScheme.primary,
  ),
  caption: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  ),
);

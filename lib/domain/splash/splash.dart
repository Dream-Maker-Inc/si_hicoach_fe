import 'dart:async';
import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/member/login/login.dart';
import 'package:si_hicoach_fe/domain/splash/splash_section.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(milliseconds: 2500),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
      ),
    );

    var assetsImage = const AssetImage('assets/splash_logo.png');
    var image = Image(image: assetsImage, width: 96);

    return SplashSection(image: image);
  }
}

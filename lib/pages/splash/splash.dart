import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(milliseconds: 2500),
      () => Navigator.of(context).pushReplacementNamed('/login'),
    );

    var assetsImage = const AssetImage('assets/splash_logo.png');
    var image = Image(image: assetsImage, width: 96);

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(64, 194, 242, 1),
                  Color.fromRGBO(99, 61, 227, 1),
                ],
              ),
            ),
            child: Center(child: image),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LeftShadow extends StatelessWidget {
  const LeftShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Color.fromRGBO(255, 255, 255, 0),
          ],
        ),
      ),
    );
  }
}

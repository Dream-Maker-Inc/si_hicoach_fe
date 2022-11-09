import 'package:flutter/material.dart';

class RightShadow extends StatelessWidget {
  const RightShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 100,
        height: 80,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 0),
              Colors.white,
            ],
          ),
        ),
      ),
    );
  }
}

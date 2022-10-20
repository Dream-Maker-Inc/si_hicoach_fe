import 'package:flutter/cupertino.dart';

class SplashSection extends StatelessWidget {
  final Image image;

  const SplashSection({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

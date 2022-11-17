import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class InbodyDetailView extends StatelessWidget {
  const InbodyDetailView({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: Image.network(image).image,
    );
  }
}

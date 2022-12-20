import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';

class InbodyDetailView extends StatelessWidget {
  const InbodyDetailView({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '인바디 데이터 상세'),
      body: PhotoView(imageProvider: Image.network(image).image),
    );
  }
}

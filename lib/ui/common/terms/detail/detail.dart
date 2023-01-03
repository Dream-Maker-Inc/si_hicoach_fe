import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class TermsDetailView extends StatelessWidget {
  final String title;
  final String content;

  const TermsDetailView({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(titleText: title),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Text(
            content,
            style: bodyMedium.copyWith(
              color: Colors.grey.shade500,
            ),
          ),
        ),
      )),
    );
  }
}

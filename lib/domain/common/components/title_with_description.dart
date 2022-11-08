import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

class TitleWithDescription extends StatelessWidget {
  final String title;
  final String description;

  const TitleWithDescription({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          title,
          style: titleLarge.copyWith(
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: smallPadding),
        Text(
          description,
          style: bodySmall.copyWith(
            color: Colors.grey.shade500,
          ),
        ),
        const SizedBox(height: smallPadding),
      ],
    );
  }
}

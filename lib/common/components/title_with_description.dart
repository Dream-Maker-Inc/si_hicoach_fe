// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

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
        Text(title, style: customTitleStyle),
        const SizedBox(height: smallPadding),
        _Desc(),
        const SizedBox(height: smallPadding),
      ],
    );
  }

  _Desc() {
    if (description.isEmpty) {
      return Container();
    }

    return Text(
      description,
      style: bodyMedium.copyWith(
        color: Colors.grey.shade500,
      ),
    );
  }
}

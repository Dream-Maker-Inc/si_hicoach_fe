import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class DetailMemo extends StatelessWidget {
  final String memo;

  const DetailMemo({super.key, required this.memo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Text(
            '메모',
            style: titleLarge.copyWith(
              color: Colors.grey.shade700,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            memo,
            style: bodySmall.copyWith(
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}

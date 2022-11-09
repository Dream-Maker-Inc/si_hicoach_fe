import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

class DetailMemo extends StatelessWidget {
  const DetailMemo({Key? key}) : super(key: key);

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
            '안녕하세요',
            style: bodySmall.copyWith(
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}

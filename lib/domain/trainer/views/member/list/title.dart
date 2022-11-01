import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

class MemberListTitle extends StatelessWidget {
  const MemberListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: defaultPadding,
        right: defaultPadding,
        top: defaultPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: const <Widget>[
          Text(
            '회원 목록',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.only(left: smallPadding),
            child: Text(
              '총 23명',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

class MemberMypageMemoDetailView extends StatelessWidget {
  const MemberMypageMemoDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '2022년 11월 11일의 메모'),
      body: Container(
        margin: const EdgeInsets.all(defaultPadding),
        child: Wrap(
          children: const <Widget>[
            Text(
                'sdafkjl;asdfkljasdfjklalsdfk;jjklasdfjkl;dfasjkl;asdfjkl;adfslk;akljajkl;afjkl;asdfjkl;sadf;jkl'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/find/views/id/success.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';

class MemberIDFindView extends StatelessWidget {
  const MemberIDFindView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const TitleWithDescription(
            title: '아이디 (이메일 찾기)',
            description: '아이디 검색을 위해 휴대폰 인증을 진행해 주세요.',
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const MemberIDFindSuccessView(),
                  ),
                );
              },
              text: '휴대폰 인증하기',
            ),
          )
        ],
      ),
    );
  }
}

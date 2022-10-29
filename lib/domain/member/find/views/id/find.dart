import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/member/find/views/id/success.dart';

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
          Text(
            '아이디 (이메일) 찾기',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: defaultPadding),
          Text(
            '아이디 검색을 위해 휴대폰 인증을 진행해 주세요.',
            style: Theme.of(context).textTheme.headline4,
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
                text: '휴대폰 인증하기'),
          )
        ],
      ),
    );
  }
}

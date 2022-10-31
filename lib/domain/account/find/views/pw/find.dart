import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/find/views/pw/success.dart';
import 'package:si_hicoach_fe/domain/common/components/text_field.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';

class MemberPWFindView extends StatelessWidget {
  const MemberPWFindView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const TitleWithDescription(
            title: '비밀번호 찾기',
            description: '회원가입 시 작성하신 아이디를 입력해 주세요.\n본인 확인을 위해 본인 인증을 진행해 주세요.',
          ),
          const CustomTextField(hintText: '아이디 입력'),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const MemberFindPwSuccessView(),
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

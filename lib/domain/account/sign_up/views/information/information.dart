import 'package:flutter/material.dart';

import 'package:si_hicoach_fe/domain/account/sign_up/views/finish/finish.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

class SignUpInformationView extends StatelessWidget {
  SignUpInformationView({Key? key}) : super(key: key);

  _handleIDInputChanged(String value) {
    print('아이디 입력됨 : $value');
  }

  _handleIDValidationButtonClicked() {
    print('아이디 중복 확인');
  }

  _handlePasswordInputChanged(String value) {
    print('비밀번호 입력됨 : $value');
  }

  _handlePasswordRepeatInputChanged(String value) {
    print('비밀번호 확인 입력됨 : $value');
  }

  @override
  Widget build(BuildContext context) {
    handleSubmitButtonClicked() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SignUpFinishView(),
        ),
      );
    }

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원가입'),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
                LinearProgressIndicator(
                  value: 0.8,
                  color: primaryColor,
                  backgroundColor: primaryColor.withAlpha(40),
                ),
                Container(
                  margin: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: <Widget>[
                      const TitleWithDescription(
                        title: '아이디 (이메일)',
                        description: '실제 사용하시는 이메일 주소를 정확히 입력해 주세요.',
                      ),
                      SizedBox(
                        height: 60,
                        child: CustomTextField(
                          hintText: '아이디 (이메일) 입력',
                          keyboardType: TextInputType.emailAddress,
                          onChanged: _handleIDInputChanged,
                          suffix: CustomElevatedButton(
                            onPressed: _handleIDValidationButtonClicked,
                            text: '중복 확인',
                          ),
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      const TitleWithDescription(
                        title: '비밀번호',
                        description: '영문 대문자와 특수문자가 포함된 8자 이상의 비밀번호를 설정해 주세요.',
                      ),
                      CustomTextField(
                        hintText: '비밀번호 입력',
                        isPassword: true,
                        onChanged: _handlePasswordInputChanged,
                      ),
                      const SizedBox(height: defaultPadding),
                      const TitleWithDescription(
                        title: '비밀번호 확인',
                        description: '비밀번호를 다시 한 번 입력해 주세요.',
                      ),
                      CustomTextField(
                        hintText: '비밀번호 입력',
                        isPassword: true,
                        onChanged: _handlePasswordRepeatInputChanged,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(defaultPadding),
                  child: CustomElevatedButton(
                    onPressed: handleSubmitButtonClicked,
                    text: '다음',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

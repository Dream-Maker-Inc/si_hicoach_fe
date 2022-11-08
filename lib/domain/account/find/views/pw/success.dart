import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/login/views/login/login.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/text_field.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';

class PasswordFindSuccessView extends StatelessWidget {
  const PasswordFindSuccessView({Key? key}) : super(key: key);

  _handlePasswordChanged(String value) {
    print('새 비밀번호 : $value');
  }

  _handlePasswordRepeatChanged(String value) {
    print('비밀번호 확인 : $value');
  }

  @override
  Widget build(BuildContext context) {
    handleSubmitButtonPressed() {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
        (Route<dynamic> route) => false,
      );
    }

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '비밀번호 재설정'),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleWithDescription(
                      title: '비밀번호 재설정',
                      description: '본인 인증이 완료되었습니다.\n새로운 비밀번호를 등록해 주세요.',
                    ),
                    const SizedBox(height: widePadding),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          const TitleWithDescription(
                            title: '비밀번호',
                            description:
                                '영문 대문자와 특수문자가 포함된 8자 이상의 비밀번호를 설정해 주세요.',
                          ),
                          CustomTextField(
                            isPassword: true,
                            hintText: '비밀번호 입력',
                            onChanged: _handlePasswordChanged,
                          ),
                          const SizedBox(height: widePadding),
                          const TitleWithDescription(
                            title: '비밀번호 확인',
                            description: '비밀번호 다시 한 번 입력해 주세요.',
                          ),
                          CustomTextField(
                            isPassword: true,
                            hintText: '비밀번호 입력',
                            onChanged: _handlePasswordRepeatChanged,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: widePadding),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        onPressed: handleSubmitButtonPressed,
                        text: '비밀번호 변경하기',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

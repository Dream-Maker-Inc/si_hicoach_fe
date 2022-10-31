import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/finish/finish.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/text_field.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';

class SignUpInformationView extends StatefulWidget {
  const SignUpInformationView({Key? key}) : super(key: key);

  @override
  State<SignUpInformationView> createState() => _SignUpInformationPageState();
}

class _SignUpInformationPageState extends State<SignUpInformationView> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();

  void _handleIDValidationButtonClicked() {
    print('_handleIDValidationButtonClicked');
  }

  void _handleSubmitButtonClicked() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SignUpFinishView(),
        ),
      );
    }
  }

  _validatePasswordRepeat(String value) {
    if (value.trim().isEmpty) {
      return '비밀번호를 입력해 주세요.';
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: const Color.fromRGBO(75, 128, 255, 0.4),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      children: <Widget>[
                        const TitleWithDescription(
                          title: '아이디 (이메일)',
                          description: '실제 사용하시는 이메일 주소를 정확히 입력해 주세요.',
                        ),
                        SizedBox(
                          child: CustomTextField(
                            hintText: '아이디 (이메일) 입력',
                            keyboardType: TextInputType.emailAddress,
                            suffix: TextButton(
                              onPressed: _handleIDValidationButtonClicked,
                              child: const Text('중복 확인'),
                            ),
                            controller: _idController,
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                        const TitleWithDescription(
                          title: '비밀번호',
                          description:
                              '영문 대문자와 특수문자가 포함된 8자 이상의 비밀번호를 설정해 주세요.',
                        ),
                        CustomTextField(
                          hintText: '비밀번호 입력',
                          isPassword: true,
                          controller: _passwordController,
                          validator: (value) => value!,
                        ),
                        const SizedBox(height: defaultPadding),
                        const TitleWithDescription(
                          title: '비밀번호 확인',
                          description: '비밀번호를 다시 한 번 입력해 주세요.',
                        ),
                        CustomTextField(
                          hintText: '비밀번호 입력',
                          isPassword: true,
                          controller: _passwordRepeatController,
                          validator: (value) => _validatePasswordRepeat(value!),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(defaultPadding),
                  child: CustomElevatedButton(
                    onPressed: _handleSubmitButtonClicked,
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

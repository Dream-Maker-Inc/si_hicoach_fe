import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/information/information.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/text_field.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';

class SignUpTypeView extends StatefulWidget {
  const SignUpTypeView({Key? key}) : super(key: key);

  @override
  State<SignUpTypeView> createState() => _SignUpTypePageState();
}

enum MemberType { trainer, ordinary }

class _SignUpTypePageState extends State<SignUpTypeView> {
  MemberType _memberType = MemberType.trainer;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _handleSubmitButtonPressed() {
    if (_memberType == MemberType.trainer) {
      if (_formKey.currentState!.validate()) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SignUpInformationView(),
          ),
        );
      }
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SignUpInformationView(),
        ),
      );
    }
  }

  _handleMemberTypeChanged(MemberType? value) {
    setState(() => _memberType = value!);
  }

  _validateNameInput(String value) {
    if (value.trim().isEmpty) {
      return '소속 헬스장명을 입력해 주세요.';
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
              children: [
                LinearProgressIndicator(
                  value: 0.6,
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: const Color.fromRGBO(70, 103, 240, 1),
                ),
                Container(
                  margin: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: <Widget>[
                      const TitleWithDescription(
                        title: '회원 분류',
                        description: '회원의 종류를 선택해 주세요.',
                      ),
                      RadioListTile<MemberType>(
                        title: const Text('헬스 트레이너'),
                        value: MemberType.trainer,
                        groupValue: _memberType,
                        onChanged: _handleMemberTypeChanged,
                      ),
                      RadioListTile<MemberType>(
                        title: const Text('일반 회원'),
                        value: MemberType.ordinary,
                        groupValue: _memberType,
                        onChanged: _handleMemberTypeChanged,
                      ),
                      if (_memberType == MemberType.trainer) ...[
                        const SizedBox(height: 40),
                        const TitleWithDescription(
                          title: '헬스장 정보',
                          description: '소속 헬스장명을 입력해 주세요.',
                        ),
                        Form(
                          key: _formKey,
                          child: CustomTextField(
                            hintText: '소속 헬스장명을 입력해 주세요.',
                            validator: (value) => _validateNameInput(value!),
                            controller: _nameController,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(defaultPadding),
                  child: CustomElevatedButton(
                    onPressed: _handleSubmitButtonPressed,
                    text: '다음',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

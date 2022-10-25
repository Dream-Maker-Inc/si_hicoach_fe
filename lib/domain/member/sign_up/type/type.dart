import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/buttons.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/common/sign_up/input_header.dart';
import 'package:si_hicoach_fe/domain/member/sign_up/information/information.dart';

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
      appBar: AppBar(
        title: const Text('회원가입'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LinearProgressIndicator(
              value: 0.6,
              color: Theme.of(context).colorScheme.primary,
              backgroundColor: const Color.fromRGBO(75, 128, 255, 0.4),
            ),
            const SignUpInputHeader(
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
              const SignUpInputHeader(
                title: '헬스장 정보',
                description: '소속 헬스장명을 입력해 주세요.',
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.all(defaultPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '소속 헬스장명을 입력해 주세요.',
                      labelText: '소속 헬스장명',
                    ),
                    controller: _nameController,
                    validator: (value) => _validateNameInput(value!),
                  ),
                ),
              ),
              const SizedBox(height: 200),
            ],
            if (_memberType == MemberType.ordinary) ...[
              const SizedBox(height: 440),
            ],
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
              ),
              child: CustomElevatedButton(
                onPressed: _handleSubmitButtonPressed,
                text: '다음',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

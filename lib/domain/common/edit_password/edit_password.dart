import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/text_field.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class EditPasswordView extends StatelessWidget {
  const EditPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleSubmitButtonPressed() {
      print('submit');
    }

    handleExistingPasswordInputChanged(String value) {
      print('기존 : $value');
    }

    handleNewPasswordInputChanged(String value) {
      print('신규 : $value');
    }

    handleNewPasswordRepeatInputChanged(String value) {
      print('신규 확인 : $value');
    }

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '비밀번호 변경',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: handleSubmitButtonPressed,
            icon: Icon(
              Icons.check_rounded,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const TitleWithDescription(
                    title: '기존 비밀번호',
                    description: '기존 비밀번호를 입력해 주세요.',
                  ),
                  CustomTextField(
                    hintText: '비밀번호 입력',
                    isPassword: true,
                    onChanged: handleExistingPasswordInputChanged,
                  ),
                  const SizedBox(height: widePadding),
                  const TitleWithDescription(
                    title: '변경할 비밀번호',
                    description: '변경할 비밀번호를 입력해 주세요.',
                  ),
                  CustomTextField(
                    hintText: '비밀번호 입력',
                    isPassword: true,
                    onChanged: handleNewPasswordInputChanged,
                  ),
                  const SizedBox(height: widePadding),
                  const TitleWithDescription(
                    title: '변경할 비밀번호 확인',
                    description: '변경할 비밀번호를 한번 더 입력해 주세요.',
                  ),
                  CustomTextField(
                    hintText: '비밀번호 입력',
                    isPassword: true,
                    onChanged: handleNewPasswordRepeatInputChanged,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

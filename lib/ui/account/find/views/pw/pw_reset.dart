import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/ui/account/find/views/pw/find_pw_vm.dart';
import 'package:si_hicoach_fe/ui/account/login/views/login.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';

class PasswordResetView extends StatefulWidget {
  final String certificationToken;

  const PasswordResetView({Key? key, required this.certificationToken})
      : super(key: key);

  @override
  State<PasswordResetView> createState() => _PasswordResetViewState();
}

class _PasswordResetViewState extends State<PasswordResetView> {
  final FindPasswordViewModel _vm = Get.find<FindPasswordViewModel>();

  _handlePasswordChanged(String value) {
    _vm.pw.value = value;
  }

  _handlePasswordRepeatChanged(String value) {
    _vm.pwRepeat.value = value;
  }

  _handleSubmitButtonPressed() {
    _vm.submit(widget.certificationToken);
  }

  _navigateLoginView() {
    Get.offAll(const LoginView());
  }

  @override
  void initState() {
    super.initState();

    _vm.updatePwSuccess.listen((isSuccess) {
      if (!isSuccess) return;

      showMySimpleDialog(
          context: context,
          title: "비밀번호 재설정 성공",
          content: "비밀번호가 재설정 되었습니다.",
          onConfirm: () {
            Get.back();
            _navigateLoginView();
          });
    });

    _vm.apiError.listen((e) {
      if (e == null) return;

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
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
                                '영문 대·소문자와 특수문자, 숫자가 포함된 8자 이상의 비밀번호를 설정해 주세요.\n\n*사용 가능한 특수문자 : !@#\$%^&*',
                          ),
                          _buildPwField(),
                          const SizedBox(height: widePadding),
                          const TitleWithDescription(
                            title: '비밀번호 확인',
                            description: '비밀번호 다시 한 번 입력해 주세요.',
                          ),
                          _buildPwRepeatField(),
                        ],
                      ),
                    ),
                    const SizedBox(height: widePadding),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: _buildSubmitButton(),
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

  _buildPwField() {
    return Obx(() {
      final errorText = _vm.passwordErrorText;
      return CustomTextField(
        isPassword: true,
        hintText: '비밀번호 입력',
        onChanged: _handlePasswordChanged,
        errorText: errorText,
      );
    });
  }

  _buildPwRepeatField() {
    return Obx(() {
      final errorText = _vm.pwRepeatErrorText;

      return CustomTextField(
        isPassword: true,
        hintText: '비밀번호 입력',
        onChanged: _handlePasswordRepeatChanged,
        errorText: errorText,
      );
    });
  }

  _buildSubmitButton() {
    return Obx(() {
      final onSubmit =
          !_vm.submitButtonDisabled ? _handleSubmitButtonPressed : null;

      return CustomElevatedButton(
        onPressed: onSubmit,
        text: '비밀번호 변경하기',
      );
    });
  }
}

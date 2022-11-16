import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/account/login/views/login.dart';
import 'package:si_hicoach_fe/domain/common/edit_password/edit_password_vm.dart';

class EditPasswordView extends StatefulWidget {
  const EditPasswordView({Key? key}) : super(key: key);

  @override
  State<EditPasswordView> createState() => _EditPasswordViewState();
}

class _EditPasswordViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '비밀번호 변경',
        actionsWidget: <Widget>[
          _buildSubmitButton(),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(defaultPadding),
              child: _buildForm(),
            ),
          ),
        ],
      ),
    );
  }

  _buildSubmitButton() {
    return Obx(() {
      final onClick = vm.isValidAll ? handleSubmitButtonPressed : null;
      final color = vm.isValidAll ? primaryColor : null;

      return IconButton(
        onPressed: onClick,
        icon: Icon(Icons.check_rounded, color: color),
      );
    });
  }

  _buildForm() {
    return Obx(() {
      final newPwValidationMsg = vm.newPwValidationMsg;
      final newPwRepeatValidationMsg = vm.newPwRepeatValidationMsg;

      return Column(
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
            errorText: newPwValidationMsg,
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
            errorText: newPwRepeatValidationMsg,
          ),
        ],
      );
    });
  }
}

class _Detail extends MyGetXState<EditPasswordView, EditPasswordViewModel> {
  handleSubmitButtonPressed() {
    vm.handleSubmit();
  }

  handleExistingPasswordInputChanged(String value) {
    vm.oldPassword.value = value;
  }

  handleNewPasswordInputChanged(String value) {
    vm.newPassword.value = value;
  }

  handleNewPasswordRepeatInputChanged(String value) {
    vm.newPwRepeat.value = value;
  }

  @override
  void initState() {
    super.initState();

    vm.updatePasswordSuccess.listen((b) {
      if (!b) return;

      Get.defaultDialog(
          title: '변경 완료',
          content: const Text("비밀번호가 변경되었습니다.\n\n다시 로그인 해주세요."),
          textConfirm: "확인",
          onConfirm: () {
            Get.offAll(() => const LoginView());
          });
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      if (e is UnauthorizedException) {
        Get.defaultDialog(
            title: '인증 실패', content: const Text("기존 비밀번호가 일치하지 않습니다."));
        return;
      }

      Get.defaultDialog(title: 'Error', content: Text(e.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  EditPasswordViewModel createViewModel() => EditPasswordViewModel();
}

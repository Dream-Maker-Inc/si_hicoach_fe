import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/exceptions/signup_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/account/find/views/pw/find_pw_vm.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/ui/account/find/views/pw/pw_reset.dart';
import 'package:si_hicoach_fe/domain/auth/certification/certification_view.dart';

class PasswordFindView extends StatefulWidget {
  const PasswordFindView({Key? key}) : super(key: key);

  @override
  State<PasswordFindView> createState() => _PasswordFindViewState();
}

class _PasswordFindViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const TitleWithDescription(
            title: '아이디 확인',
            description: '회원가입 시 작성하신 아이디를 입력해 주세요.\n본인 확인을 위해 본인 인증을 진행해 주세요.',
          ),
          CustomTextField(
            hintText: '아이디 입력',
            onChanged: handleIdInputChanged,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: _buildNextButton(),
          )
        ],
      ),
    );
  }

  _buildNextButton() {
    return Obx(() {
      final onClick = !vm.nextButtonDisabled ? handleSubmitButtonPressed : null;

      return CustomElevatedButton(
        onPressed: onClick,
        text: '휴대폰 인증하기',
      );
    });
  }
}

class _Detail extends MyGetXState<PasswordFindView, FindPasswordViewModel> {
  handleIdInputChanged(String value) {
    vm.email.value = value;
  }

  handleSubmitButtonPressed() {
    vm.validateEmail(vm.email.value);
  }

  navigatePasswordResetView(String certificationToken) {
    Get.off(PasswordResetView(certificationToken: certificationToken));
  }

  void navigateCertificationView() {
    Get.to(CertificationView(
      onSuccess: (res) {
        navigatePasswordResetView(res.data.certificationToken);
      },
    ));
  }

  @override
  void initState() {
    super.initState();

    vm.validateEmailSuccess.listen((isSuccess) {
      if (!isSuccess) return;

      showMySimpleDialog(
          context: context,
          title: "유저 없음",
          content: "유저 정보가 없습니다.",
          onConfirm: () {
            Get.back();
          });
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      if (e is AlreadyUsedEmailException) {
        return navigateCertificationView();
      }

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  FindPasswordViewModel createViewModel() => FindPasswordViewModel();
}

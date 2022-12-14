import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/exceptions/signup_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/type/type.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/third_party/iamport/iamport_certification_view.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/verify/verify_vm.dart';
import 'package:si_hicoach_fe/secret/secret.dart';

class SignUpVerifyView extends StatefulWidget {
  const SignUpVerifyView({super.key});

  @override
  State<SignUpVerifyView> createState() => _SignUpVerifyViewState();
}

class _SignUpVerifyViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원가입'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            LinearProgressIndicator(
              value: 0.4,
              color: primaryColor,
              backgroundColor: primaryColor.withAlpha(40),
            ),
            _buildIamportCertificationView(),
          ],
        ),
      ),
    );
  }

  // 아임포트 통합 인증 뷰
  _buildIamportCertificationView() {
    return Expanded(
        child: IamPortCertificationView(
      iamportUserCode: IAMPORT_USER_CODE,
      onSuccess: _handleCertificationSuccess,
      onFailure: _handleCertificationFail,
    ));
  }
}

class _Detail extends MyGetXState<SignUpVerifyView, VerifyViewModel> {
  _refresh() {
    Get.off(super.widget);
  }

  _navigateSignupTypeView() {
    Get.to(const SignUpTypeView())?.then((_) => _refresh());
  }

  _handleCertificationSuccess(String impUid) {
    vm.certificate(impUid);
  }

  _handleCertificationFail() {
    showMySimpleDialog(
        context: context,
        title: '인증 실패',
        content: "인증에 실패 했습니다.",
        onConfirm: () {
          Get.back();
          _refresh();
        });
  }

  @override
  void initState() {
    super.initState();

    vm.validatePhoneSuccess.listen((isSuccess) {
      if (!isSuccess) return;

      _navigateSignupTypeView();
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      String title = "Error";
      String message = e.toString();

      if (e is AlreadyUsedPhoneException) {
        title = "사용 불가";
        message = "이미 가입된 휴대폰 번호입니다.";
      }

      showMySimpleDialog(
          context: context,
          title: title,
          content: message,
          onConfirm: () {
            Get.back();
            _refresh();
          });
    });
  }

  @override
  Widget build(BuildContext context) => widget;

  @override
  VerifyViewModel createViewModel() => VerifyViewModel();
}

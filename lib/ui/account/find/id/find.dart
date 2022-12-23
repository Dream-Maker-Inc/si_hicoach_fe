import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/ui/account/find/id/find_id_vm.dart';
import 'package:si_hicoach_fe/ui/account/find/id/success.dart';
import 'package:si_hicoach_fe/domain/auth/certification/certification_view.dart';

class IDFindView extends StatefulWidget {
  const IDFindView({Key? key}) : super(key: key);

  @override
  State<IDFindView> createState() => _IDFindViewState();
}

class _IDFindViewState extends _Detail {
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
            title: '아이디 (이메일) 찾기',
            description: '아이디 검색을 위해 휴대폰 인증을 진행해 주세요.',
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              onPressed: () => handleSubmitButtonPressed(),
              text: '휴대폰 인증하기',
            ),
          )
        ],
      ),
    );
  }
}

class _Detail extends MyGetXState<IDFindView, FindIdViewModel> {
  handleSubmitButtonPressed() {
    Get.to(CertificationView(
      onSuccess: (res) =>
          handleCertificationSuccess(res.data.certificationToken),
    ));
  }

  handleCertificationSuccess(String certificationToken) {
    vm.findId(certificationToken);
  }

  navigateFindSuccessView(String findedId) {
    Get.off(IDFindSuccessView(id: findedId));
  }

  @override
  void initState() {
    super.initState();

    vm.findedId.listen((findedId) {
      if (findedId.isEmpty) return;

      navigateFindSuccessView(findedId);
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      if (e is UnauthorizedException) {
        showMySimpleDialog(
            context: context,
            title: "인증 실패",
            content: "비정상적인 인증 요청입니다.",
            onConfirm: () {
              Get.back();
              Get.back();
            });
      }

      if (e is NotExistException) {
        showMySimpleDialog(
            context: context,
            title: "회원 정보 없음",
            content: "등록된 회원 정보가 없습니다.",
            onConfirm: () {
              Get.back();
              Get.back();
            });
      }

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  FindIdViewModel createViewModel() => FindIdViewModel();
}

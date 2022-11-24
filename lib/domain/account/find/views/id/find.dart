import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/account/find/views/id/find_id_vm.dart';
import 'package:si_hicoach_fe/domain/account/find/views/id/success.dart';
import 'package:si_hicoach_fe/domain/auth/certification/certification_view.dart';

class IDFindView extends StatefulWidget {
  const IDFindView({Key? key}) : super(key: key);

  @override
  State<IDFindView> createState() => _IDFindViewState();
}

class _IDFindViewState extends MyGetXState<IDFindView, FindIdViewModel> {
  handleSubmitButtonPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        // builder: (BuildContext context) => const IDFindSuccessView(),
        builder: (BuildContext context) => CertificationView(
          onSuccess: (res) =>
              handleCertificationSuccess(res.data.certificationToken),
        ),
      ),
    );
  }

  handleCertificationSuccess(String certificationToken) =>
      vm.findId(certificationToken);

  navigateFindSuccessView(String findedId) {
    Logger().i(findedId);

    Get.off(
      IDFindSuccessView(id: findedId),
    );
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

      String title = "Error";
      String message = e.toString();

      if (e is UnauthorizedException) {
        title = "인증 실패";
        message = "비정상적인 인증 요청입니다.";
      }

      if (e is NotExistException) {
        title = "회원 정보 없음";
        message = "등록된 회원 정보가 없습니다.";
      }

      vm.apiError.value = null;

      Get.defaultDialog(
          title: title,
          content: Text(message),
          textConfirm: "확인",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => handleSubmitButtonPressed(context),
              text: '휴대폰 인증하기',
            ),
          )
        ],
      ),
    );
  }

  @override
  FindIdViewModel createViewModel() => FindIdViewModel();
}

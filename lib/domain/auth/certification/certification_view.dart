import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/third_party/iamport/iamport_certification_view.dart';
import 'package:si_hicoach_fe/domain/auth/certification/certification_vm.dart';
import 'package:si_hicoach_fe/infrastructure/auth/dto/request_certifications_response.dart';
import 'package:si_hicoach_fe/secret/secret.dart';

class CertificationView extends StatefulWidget {
  final Function(RequestCertificationsResponse res) onSuccess;

  const CertificationView({
    super.key,
    required this.onSuccess,
  });

  @override
  State<CertificationView> createState() => _CertificationViewState();
}

class _CertificationViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '휴대폰 인증'),
      body: SafeArea(
        child: _buildIamportCertificationView(),
      ),
    );
  }

  _buildIamportCertificationView() {
    return Expanded(
        child: IamPortCertificationView(
      iamportUserCode: IAMPORT_USER_CODE,
      onSuccess: handleCertificationSuccess,
      onFailure: handleCertificationFail,
    ));
  }
}

class _Detail extends MyGetXState<CertificationView, CertificationViewModel> {
  _refresh() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => super.widget));
  }

  handleCertificationSuccess(String impUid) {
    vm.certificate(impUid);
  }

  handleCertificationFail() {
    Get.defaultDialog(
        title: '인증 실패',
        content: const Text("인증에 실패 했습니다."),
        textConfirm: "확인",
        onConfirm: () => Get.back());
  }

  @override
  void initState() {
    super.initState();

    vm.certifiationsResponse.listen((res) {
      if (res == null) return;

      widget.onSuccess(res);
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      String title = "Error";
      String message = e.toString();

      vm.apiError.value = null;

      Get.defaultDialog(
          title: title,
          content: Text(message),
          textConfirm: "확인",
          onConfirm: () {
            Get.back();
            _refresh();
          });
    });
  }

  @override
  Widget build(BuildContext context) => widget;

  @override
  CertificationViewModel createViewModel() => CertificationViewModel();
}

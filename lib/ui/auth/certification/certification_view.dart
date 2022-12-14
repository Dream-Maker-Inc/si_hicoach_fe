import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/third_party/iamport/iamport_certification_view.dart';
import 'package:si_hicoach_fe/ui/auth/certification/certification_vm.dart';
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
    return IamPortCertificationView(
      iamportUserCode: IAMPORT_USER_CODE,
      onSuccess: _handleCertificationSuccess,
      onFailure: _handleCertificationFail,
    );
  }
}

class _Detail extends MyGetXState<CertificationView, CertificationViewModel> {
  _refresh() {
    Get.off(super.widget);
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
        });
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

      showMyHttpErrorDialog(e.toString()).then((value) => _refresh());
    });
  }

  @override
  Widget build(BuildContext context) => widget;

  @override
  CertificationViewModel createViewModel() => CertificationViewModel();
}

import 'package:flutter/material.dart';

/* 아임포트 휴대폰 본인인증 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_certification.dart';
/* 아임포트 휴대폰 본인인증 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/certification_data.dart';

class IamPortCertificationView extends StatelessWidget {
  final String iamportUserCode;
  final Function(String impUid) onSuccess;
  final VoidCallback onFailure;

  const IamPortCertificationView(
      {super.key,
      required this.iamportUserCode,
      required this.onSuccess,
      required this.onFailure});

  handleCertificationResponse(Map<String, String> result) {
    final impUid = result['imp_uid'];
    final isSuccess = result['success'] == "true";

    if (isSuccess) return onSuccess(impUid ?? "");

    onFailure();
  }

  @override
  Widget build(BuildContext context) {
    return IamportCertification(
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: _buildLoading(),

      /* [필수입력] 가맹점 식별코드 */
      userCode: iamportUserCode,

      /* [필수입력] 본인인증 데이터 */
      data: CertificationData(mRedirectUrl: "https://www.google.com"),

      /* [필수입력] 콜백 함수 */
      callback: handleCertificationResponse,
    );
  }

  _buildLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(padding: EdgeInsets.symmetric(vertical: 15)),
          Text('페이지 로딩중 입니다...', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

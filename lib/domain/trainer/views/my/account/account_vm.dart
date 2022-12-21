import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/get_my_info_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';

class MyAccountViewModel extends _FetchController {
  String get memberName => _member?.name ?? "";

  String get memberEmail => _member?.email ?? "";

  String get birthday {
    if (_member?.birthDay == null) return "";

    return DateTime.parse(_member!.birthDay).toKoreanFormat;
  }

  String get companyName => _member?.trainerInfo?.companyName ?? "";

  String get phone => _member?.phone ?? "";

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(_fetchMyInfoResponse, (res) => update());
    ever(apiError, (e) => apiError.value = null);
  }
}

class _FetchController extends GetxController {
  //
  Rx<Exception?> apiError = Rx(null);

  // fetch my info
  final Rxn<GetMyInfoResponse> _fetchMyInfoResponse = Rxn();

  Member? get _member => _fetchMyInfoResponse.value?.data.member;

  Future fetchMyInfo() async {
    final result = await MemberApi.findMe();

    result.when((e) => (apiError.value = e),
        (res) => (_fetchMyInfoResponse.value = res));
  }
}

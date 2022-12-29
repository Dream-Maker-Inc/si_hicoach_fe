import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/shared_preferences/shared_prefs.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_page/dto/get_member_my_page_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_page/member_my_page_api.dart';

class MemberMyPageViewModel extends _MyPageDataFetchFeature {
  String get memberName => data?.member.name ?? "";

  int get latestRound => data?.latestStudy?.round ?? 0;
  int get totalTicketCount => data?.matching?.ticketCount ?? 0;

  String get companyName => data?.trainer?.companyName ?? "";
  String get trainerName => data?.trainer?.name ?? "";

  int get memberId => data?.member.id ?? 0;
  int get matchingId => data?.matching?.id ?? 0;

  @override
  void onInit() {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
  }

  // 디바이스에 저장된 앱 캐시 데이터 모두 삭제
  Future deviceAppCacheClear() async {
    SharedPrefsManager().clear();
  }
}

class _MyPageDataFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  // fetch data
  final Rxn<GetMemberMyPageResponse> fetchMyPageResponse = Rxn();

  Data? get data => fetchMyPageResponse.value?.data;

  Future fetchMyPageData() async {
    final result = await MemberMyPageApi.getData();

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchMyPageResponse.value = res),
    );
  }
}

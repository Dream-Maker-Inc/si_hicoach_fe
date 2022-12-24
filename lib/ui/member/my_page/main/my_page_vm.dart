import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_page/dto/get_member_my_page_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_page/member_my_page_api.dart';

class MemberMyPageViewModel extends _MyPageDataFetchFeature {
  String get memberName => data?.member.name ?? "";

  int get latestRound => data?.latestStudy?.round ?? 0;
  int get remainingTicketCount => data?.matching?.ticketCount ?? 0;

  int get totalTicketCount {
    final totalStudyCount = data?.totalStudyCount ?? 0;

    return totalStudyCount + remainingTicketCount;
  }

  String get companyName => data?.trainer?.companyName ?? "";
  String get trainerName => data?.trainer?.name ?? "";

  int get memberId => data?.member.id ?? 0;
  int get matchingId => data?.matching?.id ?? 0;

  @override
  void onInit() {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
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

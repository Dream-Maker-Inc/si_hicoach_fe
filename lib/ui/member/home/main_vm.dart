// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/get_my_info_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/main_page/dto/get_member_main_next_studies.response.dart'
    as Next;
import 'package:si_hicoach_fe/infrastructure/page/member/main_page/member_main_api.dart';
import 'package:si_hicoach_fe/ui/member/home/sections/panels/study_list/models/study_list_item_model.dart';

class MemberMainViewModel extends _MemberMainNextStudiesFetchFeature {
  RxInt tabIndex = RxInt(0);

  String get memberName => member?.name ?? "";

  List<StudyItemModel> get nextStudyItemModels =>
      nextData
          ?.map(
            (e) => StudyItemModel(
              id: e.id,
              round: e.round,
              startedAt: e.startedAt,
              endedAt: e.endedAt,
            ),
          )
          .toList() ??
      [];

  @override
  void onInit() {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
    ever(tabIndex, (_) => refetch());
  }

  refetch() {
    final tabIndex = this.tabIndex.value;

    switch (tabIndex) {
      case 2:
        return fetchNextStudies();
    }
  }
}

// 진행 예정인 스터디 일정 불러오기
class _MemberMainNextStudiesFetchFeature extends _MyInfoFetchFeature {
  Rxn<Next.GetMemberMainNextStudiesResponse> fetchNextStudiesResponse = Rxn();

  List<Next.Data>? get nextData => fetchNextStudiesResponse.value?.data;

  fetchNextStudies() async {
    final result = await MemberMainPageApi.getNextStudies();

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchNextStudiesResponse.value = res),
    );
  }
}

// 내 정보 불러오기
class _MyInfoFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  final Rxn<GetMyInfoResponse> fetchMyInfoResponse = Rxn();
  Data? get data => fetchMyInfoResponse.value?.data;

  Member? get member => data?.member;

  Future fetchMyInfo() async {
    final result = await MemberApi.findMe();

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchMyInfoResponse.value = res),
    );
  }
}

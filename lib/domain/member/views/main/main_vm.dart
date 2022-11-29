// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/member/views/main/present/models/study_item_model.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/get_my_info_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/main_page/dto/get_member_main_next_studies.response.dart'
    as Next;
import 'package:si_hicoach_fe/infrastructure/page/member/main_page/dto/get_member_main_today_studies.response.dart'
    as Today;
import 'package:si_hicoach_fe/infrastructure/page/member/main_page/member_main_api.dart';

class MainPageViewModel extends _FetchController {
  RxInt tabIndex = RxInt(0);

  //
  String get memberName => member?.name ?? "";

  List<StudyItemModel> get todayStudyItemModels =>
      todayData
          ?.map((e) => StudyItemModel(
              id: e.id,
              round: e.round,
              startedAt: e.startedAt,
              endedAt: e.endedAt))
          .toList() ??
      [];

  //
  List<StudyItemModel> get nextStudyItemModels =>
      nextData
          ?.map((e) => StudyItemModel(
              id: e.id,
              round: e.round,
              startedAt: e.startedAt,
              endedAt: e.endedAt))
          .toList() ??
      [];

  @override
  void onInit() {
    super.onInit();

    ever(tabIndex, (_) => refetch());
  }

  //
  refetch() {
    final tabIndex = this.tabIndex.value;
    switch (tabIndex) {
      case 1:
        return fetchTodayStudies();
      case 2:
        return fetchNextStudies();
    }
  }
}

class _FetchController extends GetxController {
  //
  Rx<Exception?> apiError = Rx(null);

  // today studies
  Rxn<Today.GetMemberMainTodayStudiesResponse> fetchTodayStudiesResponse =
      Rxn();

  List<Today.Data>? get todayData => fetchTodayStudiesResponse.value?.data;

  Future fetchTodayStudies() async {
    final result = await MemberMainPageApi.getTodayStudies();

    result.when((e) => (apiError.value = e),
        (res) => (fetchTodayStudiesResponse.value = res));
  }

  // next studies
  Rxn<Next.GetMemberMainNextStudiesResponse> fetchNextStudiesResponse = Rxn();

  List<Next.Data>? get nextData => fetchNextStudiesResponse.value?.data;

  fetchNextStudies() async {
    final result = await MemberMainPageApi.getNextStudies();

    result.when((e) => (apiError.value = e),
        (res) => (fetchNextStudiesResponse.value = res));
  }

  // my info
  // fetch data
  final Rxn<GetMyInfoResponse> fetchMyInfoResponse = Rxn();
  Data? get data => fetchMyInfoResponse.value?.data;

  Member? get member => data?.member;

  Future fetchMyInfo() async {
    final result = await MemberApi.findMe();

    result.when((e) => (apiError.value = e),
        (res) => (fetchMyInfoResponse.value = res));
  }
}

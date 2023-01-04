// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/ui/member/home/components/grid/models/study_info_grid_item_model.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/main_page/member_main_api.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/main_page/dto/get_member_main_today_studies.response.dart'
    as Today;

class MainTodayStudyInfoViewModel extends _MemberMainTodayStudiesFetchFeature {
  int get studyId => targetStudy?.id ?? 0;

  List<MainStudyInfoGridItemModel> get gridModels =>
      targetStudy?.myExercises
          .map(
            (e) => MainStudyInfoGridItemModel(
              name: e.title,
              weight: e.weight,
              set: e.set,
              count: e.interval,
            ),
          )
          .toList() ??
      [];

  String get studyDateSt => targetStudy?.startedAt.toKoreanFormat ?? "";

  List<Today.Data> get data => fetchTodayStudiesResponse.value?.data ?? [];

  // 데이터 조건 : 오늘 수업 중 가장 이른 시간의 스터디 선택
  Today.Data? get targetStudy {
    if (data.isEmpty) return null;

    return data.first;
  }

  Future fetchData() async {
    return _fetchTodayStudies();
  }
}

// 오늘 스터디 일정 불러오기
class _MemberMainTodayStudiesFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);
  Rxn<Today.GetMemberMainTodayStudiesResponse> fetchTodayStudiesResponse =
      Rxn();

  List<Today.Data>? get todayData => fetchTodayStudiesResponse.value?.data;

  Future _fetchTodayStudies() async {
    final result = await MemberMainPageApi.getTodayStudies();

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchTodayStudiesResponse.value = res),
    );
  }

  @override
  void onInit() {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
  }
}

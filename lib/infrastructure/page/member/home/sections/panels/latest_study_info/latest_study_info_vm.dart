import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/home/sections/panels/latest_study_info/models/latest_study_info_model.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/main_page/dto/get_member_main_latest_study_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/main_page/member_main_api.dart';

class MainLatestStudyInfoViewModel extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  int get studyId => data?.id ?? 0;

  List<MainLatestStudyInfoModel> get pastGridModels =>
      data?.myExercises
          .map(
            (e) => MainLatestStudyInfoModel(
              id: e.exercise.id,
              name: e.exercise.title,
              weight: e.weight,
              set: e.set,
              count: e.interval,
            ),
          )
          .toList() ??
      [];

  String get studyDateSt => data?.startedAt.toKoreanFormat ?? "";

  // fetch
  Rxn<GetMemberMainLatestStudyResponse> fetchMemberMainLatestStudyResponse =
      Rxn();

  Data? get data => fetchMemberMainLatestStudyResponse.value?.data;

  fetchData() async {
    final result = await MemberMainPageApi.getLatestStudy();

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchMemberMainLatestStudyResponse.value = res),
    );
  }

  @override
  void onInit() {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
  }
}

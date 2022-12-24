import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/shared_preferences/shared_prefs.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/my_page/dto/get_my_page_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/my_page/trainer_my_page_api.dart';

class TrainerMyPageViewModel extends _MyPageDataFetchFeature {
  String get memberName => data?.trainer.name ?? "";
  String get companyName => data?.trainer.trainerInfo.companyName ?? "";
  int get lastMonthStudyCount => data?.finishedStudiesCount.lastMonth ?? 0;
  int get thisMonthAtUntilToday =>
      data?.finishedStudiesCount.thisMonthAtUntilToday ?? 0;
}

class _MyPageDataFetchFeature extends _UserIdFetchFeature {
  Rx<Exception?> apiError = Rx(null);
  final Rxn<GetMyPageResponse> fetchMyPageResponse = Rxn();

  Data? get data => fetchMyPageResponse.value?.data;

  Future fetchMyPageData() async {
    final result = await TrainerMyPageApi.getData();

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchMyPageResponse.value = res),
    );
  }
}

class _UserIdFetchFeature extends GetxController {
  getUserId() async {
    return SharedPrefsManager().getUserId();
  }
}

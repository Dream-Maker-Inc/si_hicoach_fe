import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/my_page/dto/get_my_page_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/my_page/trainer_my_page_api.dart';

class MyPageViewModel extends _FetchController {
  String get memberName => data?.trainer.name ?? "";

  String get companyName => data?.trainer.trainerInfo.companyName ?? "";

  int get lastMonthStudyCount => data?.finishedStudiesCount.lastMonth ?? 0;

  int get thisMonthAtUntilToday =>
      data?.finishedStudiesCount.thisMonthAtUntilToday ?? 0;

  @override
  Future<void> onInit() async {
    super.onInit();

    ever(fetchMyPageResponse, (res) => update());
  }
}

class _FetchController extends GetxController {
  int userId = 0;

  //
  Rx<Exception?> apiError = Rx(null);

  // fetch data
  final Rxn<GetMyPageResponse> fetchMyPageResponse = Rxn();

  Data? get data => fetchMyPageResponse.value?.data;

  Future fetchMyPageData() async {
    final result = await TrainerMyPageApi.getData();

    result.when((e) => (apiError.value = e),
            (res) => (fetchMyPageResponse.value = res));
  }

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    _initUserId();
  }

  _initUserId() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt(SharedPrefsKeys.id.key) ?? 0;
  }
}

// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/todo_list/list_item.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/get_my_info_response.dart'
    as MyInfo;
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/main/dto/get_trainer_main_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/main/trainer_main_page_api.dart';

class MainViewModel extends _FetchController {
  Rx<DateTime> targetDate = Rx(DateTime.now());
  String get targetDateString =>
      DateFormat('yyyy-MM-dd').format(targetDate.value);

  //
  String get memberName => _member?.name ?? "";

  List<TrainerMainTodoItemModel> get todoItemModels => data
      .map((data) => TrainerMainTodoItemModel(
          studyId: data.study.id,
          time: data.study.startedAt.hour,
          name: data.member.name,
          isCompleted: data.study.isFinished,
          studyCount: data.totalStudyCount,
          totalTicketCount: data.matching.ticketCount))
      .toList();

  @override
  void onInit() {
    super.onInit();

    ever(targetDate, (_) {
      fetchData(targetDateString);
    });
  }
}

class _FetchController extends GetxController {
  //
  Rx<Exception?> apiError = Rx(null);

  // fetch main data
  final Rxn<GetTrainerMainResponse> _fetchMainResponse = Rxn();

  List<Data> get data => _fetchMainResponse.value?.data ?? [];

  Future fetchData(String date) async {
    final result = await TrainerMainPageApi.getData(date);

    result.when((e) => (apiError.value = e),
        (response) => (_fetchMainResponse.value = response));
  }

  // fetch my info
  final Rxn<MyInfo.GetMyInfoResponse> _fetchMyInfoResponse = Rxn();

  MyInfo.Member? get _member => _fetchMyInfoResponse.value?.data.member;

  Future fetchMyInfo() async {
    final result = await MemberApi.findMe();

    result.when((e) => (apiError.value = e),
        (res) => (_fetchMyInfoResponse.value = res));
  }
}

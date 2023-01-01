// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/get_matching_response.dart'
    as Tickets;
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';
import 'package:si_hicoach_fe/infrastructure/tickets/tickets_api.dart';
import 'package:si_hicoach_fe/ui/common/study/common/templates/study_form_vm.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/mutation/mutate_study_dto.dart';

class StudyCreateViewModel extends TicketInfoFeature {
  int matchingId = 0;

  StudyCreateViewModel({required this.matchingId});

  List<MyExercises> get myExercisesDto => myExercises.map((it) {
        final exerciseModel =
            exerciseItemModels.firstWhere((el) => el.id == it.id);

        final myExercise = MyExercises(
          interval: exerciseModel.count,
          set: exerciseModel.sets,
          weight: exerciseModel.weight,
          exerciseId: exerciseModel.id,
        );

        return myExercise;
      }).toList();

  //
  final RxBool studyCreateSuccess = RxBool(false);

  Future createStudy() async {
    final dto = CreateStudyDto(
      startedAt: studyTime.value.getLocalDate(),
      endedAt: studyTime.value.getLocalDateOfEndDate(),
      memo: memo.value ?? "",
      myExercises: myExercisesDto,
    );

    final result = await StudyApi.createStudy(matchingId, dto);

    result.when(
      (e) => (apiError.value = e),
      (res) => (studyCreateSuccess.value = res),
    );
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    memo.value = "";
  }

  @override
  Future submit() async {
    createStudy();
  }
}

class TicketInfoFeature extends StudyFormViewModel {
  Rx<Exception?> apiError = Rx(null);

  final Rxn<Tickets.GetMatchingResponse> fetchTicketsInfoResponse = Rxn();
  Tickets.Data? get _data => fetchTicketsInfoResponse.value?.data;

  bool isTicketUseable() {
    final totalTicketCount = _data?.totalTicketCount ?? 0;
    final totalStudyCount = _data?.totalStudyCount ?? 0;

    return (totalTicketCount - totalStudyCount) > 0;
  }

  Future fetchTicketsInfo(int matchingId) async {
    final result = await TicketsApi.getTicketsInfo(matchingId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchTicketsInfoResponse.value = res),
    );
  }
}

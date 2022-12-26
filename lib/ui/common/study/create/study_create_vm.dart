// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/tickets/dto/get_tickets_info_response.dart'
    as Tickets;
import 'package:si_hicoach_fe/infrastructure/tickets/tickets_api.dart';
import 'package:si_hicoach_fe/ui/common/study/common/templates/study_form_vm.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/mutation/mutate_study_dto.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

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
        matchingId: matchingId,
        startedAt: studyTime.value.getLocalDate(),
        endedAt: studyTime.value.getLocalDateOfEndDate(),
        memo: memo.value ?? "",
        myExercises: myExercisesDto);

    final result = await StudyApi.createStudy(dto);

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

  final Rxn<Tickets.GetTicketsInfoResponse> fetchTicketsInfoResponse = Rxn();
  Tickets.Data? get _data => fetchTicketsInfoResponse.value?.data;

  int get finishedStudyCount => _data?.finishedStudyCount ?? 0;
  int get totalTicketCount => _data?.remainingTicketCount ?? 0;

  bool isTicketUseable() => (totalTicketCount - finishedStudyCount) > 0;

  Future fetchTicketsInfo(int matchingId) async {
    final result = await TicketsApi.getTicketsInfo(matchingId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchTicketsInfoResponse.value = res),
    );
  }
}

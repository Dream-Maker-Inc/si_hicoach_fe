import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/tickets/dto/get_tickets_info_response.dart';
import 'package:si_hicoach_fe/infrastructure/tickets/tickets_api.dart';

class TicketsViewModel extends GetxController {
  int matchingId = 0;

  //
  RxInt finishedStudyCount = RxInt(0);
  RxInt remainingTicketCount = RxInt(0);

  int get totalTicketCount =>
      finishedStudyCount.value + remainingTicketCount.value;

  //
  RxInt countOfAdd = RxInt(0);
  RxInt countOfMinus = RxInt(0);

  //
  Rx<Exception?> apiError = Rx(null);

  // fetch tickets info
  final Rxn<GetTicketsInfoResponse> fetchTicketsInfoResponse = Rxn();

  fetchTicketsInfo() async {
    final result = await TicketsApi.getTicketsInfo(matchingId);

    result.when((e) => (apiError.value = e),
        (response) => (fetchTicketsInfoResponse.value = response));
  }

  // mutation ticket count
  final RxBool increaseTicketsSuccess = RxBool(false);
  final RxBool decreaseTicketsSuccess = RxBool(false);

  increaseTickets() async {
    final result = await TicketsApi.increase(
        matchingId: matchingId, count: countOfAdd.value);

    result.when((e) => (apiError.value = e),
        (response) => (increaseTicketsSuccess.value = response));
  }

  decreaseTickets() async {
    final result = await TicketsApi.decrease(
        matchingId: matchingId, count: countOfMinus.value);

    result.when((e) => (apiError.value = e),
        (response) => (decreaseTicketsSuccess.value = response));
  }

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(fetchTicketsInfoResponse, (res) {
      final data = res?.data;

      finishedStudyCount.value = data?.finishedStudyCount ?? 0;
      remainingTicketCount.value = data?.remainingTicketCount ?? 0;
    });

    ever(increaseTicketsSuccess, (isSuccess) {
      if (isSuccess == false) return;
      fetchTicketsInfo();
    });

    ever(decreaseTicketsSuccess, (isSuccess) {
      if (isSuccess == false) return;
      fetchTicketsInfo();
    });
  }
}
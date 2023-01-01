import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/get_matching_response.dart';
import 'package:si_hicoach_fe/infrastructure/tickets/tickets_api.dart';

class TicketsViewModel extends TicketDecreaseFeature {
  int matchingId = 0;

  TicketsViewModel({required this.matchingId});

  // 남은 수강권 개수
  int get remainingTicketCount => totalTicketCount - totalStudyCount;

  //
  RxInt countOfAdd = RxInt(0);
  RxInt countOfMinus = RxInt(0);

  // 수강권 차감 가능 여부
  bool get isMinusable => remainingTicketCount > 0;

  @override
  Future<void> onInit() async {
    super.onInit();

    ever(increaseTicketsSuccess, (b) {
      if (!b) return;
      increaseTicketsSuccess.value = false;

      refetch();
    });

    ever(decreaseTicketsSuccess, (b) {
      if (!b) return;
      decreaseTicketsSuccess.value = false;

      refetch();
    });
  }

  refetch() {
    fetchTicketsInfo(matchingId);
  }
}

class TicketDecreaseFeature extends TicketIncreaseFeature {
  final RxBool decreaseTicketsSuccess = RxBool(false);

  decreaseTickets(int matchingId, int countOfMinus) async {
    final result = await TicketsApi.decrease(
      matchingId: matchingId,
      count: countOfMinus,
    );

    result.when(
      (e) => (apiError.value = e),
      (res) => (decreaseTicketsSuccess.value = res),
    );
  }
}

class TicketIncreaseFeature extends TicketsInfoFetchFeature {
  final RxBool increaseTicketsSuccess = RxBool(false);

  increaseTickets(int matchingId, int countOfAdd) async {
    final result = await TicketsApi.increase(
      matchingId: matchingId,
      count: countOfAdd,
    );

    result.when(
      (e) => (apiError.value = e),
      (res) => (increaseTicketsSuccess.value = res),
    );
  }
}

class TicketsInfoFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  final Rxn<GetMatchingResponse> fetchTicketsInfoResponse = Rxn();
  Data? get _data => fetchTicketsInfoResponse.value?.data;

  int get totalStudyCount => _data?.totalStudyCount ?? 0;
  int get totalTicketCount => _data?.totalTicketCount ?? 0;

  fetchTicketsInfo(int matchingId) async {
    final result = await TicketsApi.getTicketsInfo(matchingId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchTicketsInfoResponse.value = res),
    );
  }
}

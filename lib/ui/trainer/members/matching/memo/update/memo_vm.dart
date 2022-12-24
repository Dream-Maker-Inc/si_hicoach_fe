// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/get_matching_response.dart'
    as MatchingResponse;
import 'package:si_hicoach_fe/infrastructure/matching/dto/update_matching_dto.dart';
import 'package:si_hicoach_fe/infrastructure/matching/matching_api.dart';

class MemoEditViewModel extends _MatchingUpdateFeature {
  RxString initialMemo = RxString('');
  RxString memo = RxString('');

  @override
  Future<void> onInit() async {
    super.onInit();

    ever(_fetchMatchingResponse, (res) {
      initialMemo.value = _memo;
    });
  }
}

// 매칭 정보 수정 서비스
class _MatchingUpdateFeature extends _MatchingFetchFeature {
  // update matching goal
  final RxBool matchingUpdateSuccess = RxBool(false);

  handleSubmit(int matchingId, String memo) async {
    final dto = UpdateMatchingDto(memo: memo);
    final result = await MatchingApi.update(matchingId, dto);

    result.when(
      (e) => (apiError.value = e),
      (res) => (matchingUpdateSuccess.value = res),
    );
  }
}

// 매칭 정보 불러오기 서비스
class _MatchingFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  // fetch matching
  final Rxn<MatchingResponse.GetMatchingResponse> _fetchMatchingResponse =
      Rxn();

  MatchingResponse.Data? get matching => _fetchMatchingResponse.value?.data;

  String get _memo => matching?.memo ?? "";

  Future<void> fetchMatching(int matchingId) async {
    final result = await MatchingApi.findOne(matchingId);

    result.when((e) => (apiError.value = e),
        (res) => (_fetchMatchingResponse.value = res));
  }
}

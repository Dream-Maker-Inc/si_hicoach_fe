import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:si_hicoach_fe/domain/member/views/my/memo/memo_model.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_memos/dto/get_my_memos_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_memos/my_memos_api.dart';

class MyMemoPageViewModel extends _FetchController {
  List<MemoModel> get items => _items.map((it) {
        final formatter = DateFormat('yyyy년 MM월 dd일');

        return MemoModel(
            studyId: it.studyId,
            date: formatter.format(it.createdAt),
            content: it.memo);
      }).toList();
}

class _FetchController extends GetxController {
  //
  Rx<Exception?> apiError = Rx(null);

  // fetch data
  final Rxn<GetMyMemosResponse> fetchResponse = Rxn();
  Data? get data => fetchResponse.value?.data;
  List<Items> get _items => data?.items ?? [];

  Future fetchData() async {
    final result = await MyMemosPageApi.getData();

    result.when(
        (e) => (apiError.value = e), (res) => (fetchResponse.value = res));
  }

  @override
  Future refresh() async {
    fetchData();
  }
}

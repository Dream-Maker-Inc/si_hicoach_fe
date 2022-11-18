import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/list_tile.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_item/dto/get_exercise_items_response.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_item/exercise_items_api.dart';

class ExerciseAddViewModel extends _FetchController {
  RxString keyword = RxString('');

  RxList<CustomListTileWithArrowModel> searchItems = RxList();

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(_fetchExercisesResponse, _handlefetchExercisesResponse);
  }

  _handlefetchExercisesResponse(GetExerciseItemsResponse? res) {
    if (res == null) return;

    searchItems.value = exercises
        .map((e) => CustomListTileWithArrowModel(e.id, e.title, e.part))
        .toList();
  }
}

class _FetchController extends GetxController {
  //
  Rx<Exception?> apiError = Rx(null);

  // search
  final Rxn<GetExerciseItemsResponse> _fetchExercisesResponse = Rxn();

  List<Items> get exercises => _fetchExercisesResponse.value?.data.items ?? [];

  Future searchExerciseItems(String title) async {
    final result = await ExerciseItemsApi.search(title);

    result.when((e) => (apiError.value = e),
        (res) => (_fetchExercisesResponse.value = res));
    return;
  }
}

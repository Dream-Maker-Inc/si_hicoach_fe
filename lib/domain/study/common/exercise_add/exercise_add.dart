import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/components/list_tile.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/study/common/exercise_add/exercise_add_vm.dart';

class ExerciseAddView extends StatefulWidget {
  const ExerciseAddView({Key? key}) : super(key: key);

  @override
  State<ExerciseAddView> createState() => _ExerciseAddViewState();
}

class _ExerciseAddViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '운동 추가'),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: _buildSearchField(),
                      ),
                      IconButton(
                        onPressed: handleSearchButtonPressed,
                        icon: const Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CustomDivider(),
            Expanded(
              flex: 1,
              child: _buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  _buildSearchField() {
    return TextField(
      decoration: const InputDecoration(
        hintText: '검색어를 입력해 주세요.',
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
      onChanged: handleKeywordChange,
    );
  }

  _buildListView() {
    return Obx(() {
      final items = vm.searchItems;

      return ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, index) => CustomListTileWithArrow(
                model: items[index],
                onTap: () => handleItemClick(items[index]),
              ));
    });
  }
}

class _Detail extends MyGetXState<ExerciseAddView, ExerciseAddViewModel> {
  handleKeywordChange(String v) {
    vm.keyword.value = v;
  }

  handleSearchButtonPressed() {
    vm.searchExerciseItems(vm.keyword.value);
  }

  handleItemClick(CustomListTileWithArrowModel model) {
    final exercise = vm.findExercise(model.id);

    Get.back(result: {'exercise': exercise});
  }

  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      showMySimpleDialog(
          context: context,
          title: 'Error',
          content: e.toString(),
          confirmText: "뒤로가기",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.searchExerciseItems('')]);
    });

    return widget;
  }

  @override
  ExerciseAddViewModel createViewModel() => ExerciseAddViewModel();
}

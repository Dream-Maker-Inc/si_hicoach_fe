import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/member/views/my/memo/memo_vm.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';

class MemoListView extends StatefulWidget {
  const MemoListView({Key? key}) : super(key: key);

  @override
  State<MemoListView> createState() => _MemoListViewState();
}

class _MemoListViewState extends _Detail {
  onMemoItemPressed(int studyId) {
    Get.to(
      StudyDetailView(
        studyId: studyId,
        isMemberDetailEnabled: false,
      ),
    )?.then((_) => vm.refetch());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '메모 모아보기'),
      body: _buildListView(context),
    );
  }

  _buildListView(BuildContext context) {
    return Obx(() {
      final items = vm.items;

      return items.isNotEmpty
          ? ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Column(children: [
                  ListTile(
                    title: Text(item.date),
                    subtitle: Opacity(
                        opacity: 0.8,
                        child: Text(
                          item.content,
                          overflow: TextOverflow.ellipsis,
                        )),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () => onMemoItemPressed(item.studyId),
                  ),
                  const Divider()
                ]);
              },
            )
          : const EmptyDataPatch();
    });
  }
}

class _Detail extends MyGetXState<MemoListView, MyMemoPageViewModel> {
  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      vm.apiError.value = null;

      showMySimpleDialog(
          context: context,
          title: 'Error',
          content: e.toString(),
          onConfirm: () {
            Get.back();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.fetchData()]);
    });

    return widget;
  }

  @override
  MyMemoPageViewModel createViewModel() => MyMemoPageViewModel();
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/member/my_page/memo/list/memo_list_vm.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';

class MyMemoListView extends StatefulWidget {
  const MyMemoListView({Key? key}) : super(key: key);

  @override
  State<MyMemoListView> createState() => _MyMemoListViewState();
}

class _MyMemoListViewState extends _Detail {
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

      if (items.isEmpty) return const EmptyDataPatch();

      return ListView.builder(
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
      );
    });
  }
}

class _Detail extends MyGetXState<MyMemoListView, MyMemoListViewModel> {
  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      showMyHttpErrorDialog(e.toString());
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
  MyMemoListViewModel createViewModel() => MyMemoListViewModel();
}

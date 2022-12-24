import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/member/my_page/account/detail/account_vm.dart';

class MemberAccountDetailView extends StatefulWidget {
  const MemberAccountDetailView({Key? key}) : super(key: key);

  @override
  State<MemberAccountDetailView> createState() =>
      _MemberAccountDetailViewState();
}

class _MemberAccountDetailViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const CustomAppBarArrowBack(
        titleText: '계정 정보',
      ),
      body: _buildListView(),
    );
  }

  _buildListView() {
    return Obx(() {
      final columns = vm.columns;

      return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: ListTile.divideTiles(
                context: context,
                tiles: columns
                    .map(
                      (it) => ListTile(
                        title: Text(it.item1),
                        trailing: Text(it.item2),
                      ),
                    )
                    .toList())
            .toList(),
      );
    });
  }
}

class _Detail
    extends MyGetXState<MemberAccountDetailView, MemberAccountDetailViewModel> {
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
  MemberAccountDetailViewModel createViewModel() =>
      MemberAccountDetailViewModel();
}

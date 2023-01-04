import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/member/home/components/grid/models/study_info_grid_item.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';
import 'package:si_hicoach_fe/ui/member/home/sections/panels/today_study_info/today_study_info_vm.dart';

class MainTodayStudyInfoView extends StatefulWidget {
  const MainTodayStudyInfoView({Key? key}) : super(key: key);

  @override
  State<MainTodayStudyInfoView> createState() => _MainTodayStudyInfoViewState();
}

class _MainTodayStudyInfoViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      if (vm.gridModels.isEmpty) {
        return const EmptyDataPatch();
      }

      return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: defaultPadding,
            left: defaultPadding,
            right: defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildDateCaption(),
              const SizedBox(height: smallPadding),
              _buildListView(),
            ],
          ),
        ),
      );
    });
  }

  _buildDateCaption() {
    return Obx(() {
      final studyDateSt = vm.studyDateSt;

      return Text(
        '최근 수업 일자 : $studyDateSt',
        style: bodyMedium.copyWith(
          color: Colors.grey.shade500,
        ),
      );
    });
  }

  _buildListView() {
    const borderRadius = BorderRadius.all(Radius.circular(smallPadding));

    return Obx(() {
      final models = vm.gridModels;

      return Wrap(
        runSpacing: 16,
        spacing: 16,
        children: models
            .map(
              (it) => InkWell(
                onTap: () => handleItemClick(vm.studyId),
                borderRadius: borderRadius,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 2.1) -
                      (smallPadding * 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: borderRadius,
                  ),
                  padding: const EdgeInsets.all(defaultPadding),
                  child: MainStudyInfoGridItem(
                    name: it.name,
                    count: it.count,
                    set: it.set,
                    weight: it.weight,
                  ),
                ),
              ),
            )
            .toList(),
      );
    });
  }
}

class _Detail
    extends MyGetXState<MainTodayStudyInfoView, MainTodayStudyInfoViewModel> {
  handleItemClick(int studyId) {
    Get.to(StudyDetailView(
      studyId: studyId,
      readonly: true,
      isMemberDetailEnabled: false,
    ))?.then((_) => vm.fetchData());
  }

  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      if (e is NotExistException) {
        Logger().w("not exist latest study data");
        return;
      }

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => vm.fetchData(),
    );

    return widget;
  }

  @override
  MainTodayStudyInfoViewModel createViewModel() =>
      MainTodayStudyInfoViewModel();
}

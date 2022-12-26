import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/home/sections/panels/latest_study_info/latest_study_info_item.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/home/sections/panels/latest_study_info/latest_study_info_vm.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';

class MainLatestStudyInfoView extends StatefulWidget {
  const MainLatestStudyInfoView({Key? key}) : super(key: key);

  @override
  State<MainLatestStudyInfoView> createState() =>
      _MainLatestStudyInfoViewState();
}

class _MainLatestStudyInfoViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      if (vm.pastGridModels.isEmpty) {
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
      final models = vm.pastGridModels;

      return Wrap(
        runSpacing: 16,
        children: models
            .map(
              (it) => InkWell(
                onTap: () => handleItemClick(vm.studyId),
                borderRadius: borderRadius,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: borderRadius,
                  ),
                  padding: const EdgeInsets.all(defaultPadding),
                  child: MainLatestStudyInfoItem(
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
    extends MyGetXState<MainLatestStudyInfoView, MainLatestStudyInfoViewModel> {
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
  MainLatestStudyInfoViewModel createViewModel() =>
      MainLatestStudyInfoViewModel();
}

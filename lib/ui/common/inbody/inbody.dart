import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/components/overlay_circular_progress_indicator.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/file_picker/file_picker_func.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/common/inbody/inbody_vm.dart';
import 'package:si_hicoach_fe/ui/common/inbody/item.dart';

class InbodyView extends StatefulWidget {
  final int memberId;
  final int matchingId;
  final bool isRoleTrainer;

  const InbodyView({
    super.key,
    required this.memberId,
    required this.matchingId,
    this.isRoleTrainer = true,
  });

  @override
  State<InbodyView> createState() => _InbodyViewState();
}

class _InbodyViewState extends _Detail {
  bool get isRoleTrainer => widget.isRoleTrainer;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      final loadingMsg = vm.loadingMsg.value;

      return OverlayCircularProgressIndicator(
          message: loadingMsg,
          child: Scaffold(
            appBar: _buildAppbar(),
            body: _buildGrid(),
          ));
    });
  }

  _buildAppbar() {
    final List<Widget> renderActionIcon = !isRoleTrainer
        ? <Widget>[]
        : [
            IconButton(
              onPressed: handleUploadClick,
              icon: const Icon(Icons.add_rounded),
            )
          ];

    return CustomAppBarArrowBack(
      titleText: '인바디 데이터',
      actionsWidget: renderActionIcon,
    );
  }

  _buildGrid() {
    return Obx(() {
      final models = vm.inBodyModels;

      if (models.isEmpty) return const EmptyDataPatch();

      return GridView.count(
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(defaultPadding),
        children: models
            .map(
              (it) => InbodyItem(
                model: it,
                editable: isRoleTrainer,
              ),
            )
            .toList(),
      );
    });
  }
}

class _Detail extends MyGetXState<InbodyView, InBodyViewModel> {
  handleUploadClick() async {
    final result = await showFilePickerAndGet();
    if (result == null) return;

    vm.createTodayInBody(vm.memberId, result);
  }

  @override
  void initState() {
    super.initState();

    vm.todayInBodyCreateSuccess.listen((b) {
      if (!b) return;

      Get.snackbar(
        "인바디 등록 성공",
        "인바디 정보가 등록되었습니다.",
        snackPosition: SnackPosition.BOTTOM,
      );
    });

    vm.inBodyUpdateSuccess.listen((b) {
      if (!b) return;

      Get.snackbar(
        "인바디 수정 성공",
        "인바디 정보가 수정되었습니다.",
        snackPosition: SnackPosition.BOTTOM,
      );
    });

    vm.inBodyDeleteSuccess.listen((b) {
      if (!b) return;

      Get.snackbar(
        "인바디 삭제 성공",
        "인바디 정보가 삭제되었습니다.",
        snackPosition: SnackPosition.BOTTOM,
      );
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      if (e is AlreadyInBodyException) {
        return showMySimpleDialog(
            context: context,
            title: '요청 실패',
            content: "이미 오늘 인바디가 등록되어 있습니다.",
            onConfirm: () {
              Get.back();
            });
      }

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.fetchMemberInbodies(vm.memberId)]);
    });

    return widget;
  }

  @override
  InBodyViewModel createViewModel() => InBodyViewModel(
        memberId: widget.memberId,
        matchingId: widget.matchingId,
      );
}

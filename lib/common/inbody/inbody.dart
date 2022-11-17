import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/overlay_circular_progress_indicator.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/file_picker/file_picker_func.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/inbody/inbody_vm.dart';
import 'package:si_hicoach_fe/common/inbody/item.dart';

class InbodyView extends StatefulWidget {
  final int memberId;
  final int matchingId;

  const InbodyView(
      {super.key, required this.memberId, required this.matchingId});

  @override
  State<InbodyView> createState() => _InbodyViewState();
}

class _InbodyViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      final loadingMsg = vm.loadingMsg.value;

      return OverlayCircularProgressIndicator(
          message: loadingMsg,
          child: Scaffold(
            appBar: CustomAppBarArrowBack(
              titleText: '인바디 데이터',
              actionsWidget: <Widget>[
                IconButton(
                  onPressed: handleUploadClick,
                  icon: const Icon(Icons.add_rounded),
                ),
              ],
            ),
            body: _buildGrid(),
          ));
    });
  }

  _buildGrid() {
    return Obx(() {
      final models = vm.inBodyModels;

      return GridView.count(
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(defaultPadding),
        children: List.from(
          models.map(
            (it) => InbodyItem(model: it),
          ),
        ),
      );
    });
  }
}

class _Detail extends MyGetXState<InbodyView, InBodyViewModel> {
  handleUploadClick() async {
    final result = await showFilePickerAndGet();
    if (result == null) return;

    vm.uploadTodayInBody(result);
  }

  @override
  void initState() {
    super.initState();

    vm.memberId = widget.memberId;
    vm.matchingId = widget.matchingId;

    vm.uploadTodayInBodySuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      Get.snackbar("인바디 등록 성공", "인바디 정보가 등록되었습니다.",
          snackPosition: SnackPosition.BOTTOM);
      vm.uploadTodayInBodySuccess.value = false;
    });

    vm.updateInBodySuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      Get.snackbar(
        "인바디 수정 성공",
        "인바디 정보가 수정되었습니다.",
        snackPosition: SnackPosition.BOTTOM,
      );
      vm.updateInBodySuccess.value = false;
    });

    vm.deleteInBodySuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      Get.snackbar(
        "인바디 삭제 성공",
        "인바디 정보가 삭제되었습니다.",
        snackPosition: SnackPosition.BOTTOM,
      );
      vm.deleteInBodySuccess.value = false;
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      vm.apiError.value = null;

      if (e is AlreadyInBodyException) {
        Get.defaultDialog(
            title: '요청 실패', content: const Text("이미 오늘 인바디가 등록되어 있습니다."));
        return;
      }

      Get.defaultDialog(title: 'Error', content: Text(e.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.fetchMemberStudies(vm.memberId)]);
    });

    return widget;
  }

  @override
  InBodyViewModel createViewModel() => InBodyViewModel();
}

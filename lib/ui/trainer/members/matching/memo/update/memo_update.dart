import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/ui/trainer/members/matching/memo/update/memo_update_vm.dart';

class MemoUpdateView extends StatefulWidget {
  final int matchingId;

  const MemoUpdateView({super.key, required this.matchingId});

  @override
  State<MemoUpdateView> createState() => _MemoUpdateViewState();
}

class _MemoUpdateViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '메모 수정',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: handleSubmit,
            icon: Icon(
              Icons.check_rounded,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.all(defaultPadding),
        child: _buildTextField(),
      ),
    );
  }

  _buildTextField() {
    return Obx(() {
      final controller = TextEditingController();
      controller.text = vm.initialMemo.value;

      return TextFormField(
        controller: controller,
        maxLength: 1000,
        minLines: 5,
        maxLines: 100,
        decoration: InputDecoration(
          counterText: '',
          hintText: '회원님에 대해 기억해야 할 사항을 자유롭게 기록하세요.',
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
              width: 4,
            ),
          ),
        ),
        onChanged: handleMemoChange,
      );
    });
  }
}

class _Detail extends MyGetXState<MemoUpdateView, MemoUpdateViewModel> {
  handleMemoChange(String v) {
    vm.memo.value = v;
  }

  handleSubmit() {
    vm.handleSubmit(widget.matchingId, vm.memo.value);
  }

  @override
  void initState() {
    super.initState();

    vm.matchingUpdateSuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      showMySimpleDialog(
          context: context,
          title: '수정 성공',
          content: "메모가 수정되었습니다.",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.fetchMatching(widget.matchingId)]);
    });

    return widget;
  }

  @override
  MemoUpdateViewModel createViewModel() => MemoUpdateViewModel();
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/ui/trainer/my-page/account/update/account_update_vm.dart';

class TrainerMyAccountUpdateView extends StatefulWidget {
  final String companyName;

  const TrainerMyAccountUpdateView({super.key, required this.companyName});

  @override
  State<TrainerMyAccountUpdateView> createState() =>
      _TrainerMyAccountUpdateViewState();
}

class _TrainerMyAccountUpdateViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '소속 수정',
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
        margin: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const TitleWithDescription(
              title: '소속 수정',
              description: '변경된 소속을 입력해 주세요.',
            ),
            const SizedBox(height: defaultPadding),
            _buildInput()
          ],
        ),
      ),
    );
  }

  _buildInput() {
    return Obx(() {
      final controller = TextEditingController();
      controller.text = vm.initialCompanyName.value;

      return CustomTextField(
        controller: controller,
        hintText: '소속 입력',
        onChanged: handleInputChange,
      );
    });
  }
}

class _Detail extends MyGetXState<TrainerMyAccountUpdateView,
    TrainerAccountUpdateViewModel> {
  handleInputChange(String v) {
    vm.companyName.value = v;
  }

  handleSubmit() {
    vm.updateMyCompany();
  }

  @override
  void initState() {
    super.initState();

    vm.updateMyCompanyResponse.listen((res) {
      if (res == false) return;

      showMySimpleDialog(
          context: context,
          title: '처리 완료',
          content: "소속이 수정되었습니다.",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      showMyHttpErrorDialog(e.toString()).then((value) => Get.back());
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  TrainerAccountUpdateViewModel createViewModel() =>
      TrainerAccountUpdateViewModel(initialCompanyName: widget.companyName);
}

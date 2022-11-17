import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/file_picker/file_picker_func.dart';
import 'package:si_hicoach_fe/common/inbody/inbody_vm.dart';
import 'package:si_hicoach_fe/common/inbody/models/inbody_model.dart';
import 'package:si_hicoach_fe/common/inbody/detail.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';

enum MoreSelections { edit, delete }

class InbodyItem extends StatelessWidget {
  final InBodyModel model;
  final InBodyViewModel vm = Get.find<InBodyViewModel>();

  InbodyItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  _onEditButtonTapped() async {
    final result = await showFilePickerAndGet();
    if (result == null) return;

    vm.updateInBody(model.studyId, result);
  }

  _onDeleteButtonTapped(BuildContext ctx) {
    Future.delayed(
        const Duration(seconds: 0),
        () => Get.defaultDialog(
            title: "삭제 확인",
            content: const Text("정말 인바디 정보를 삭제하시겠습니까?"),
            textCancel: "취소",
            textConfirm: "삭제",
            cancelTextColor: primaryColor,
            confirmTextColor: Colors.grey.shade600,
            onConfirm: () {
              vm.deleteInBody(model.studyId);
              Get.back();
            }));
  }

  _handleCardClick() {
    Get.to(InbodyDetailView(image: model.imageUrl));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleCardClick,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black.withAlpha(10), width: 1),
            borderRadius: BorderRadius.circular(minPadding),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                    child: Image.network(model.imageUrl),
                  ),
                  const CustomDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(smallPadding),
                          child: Text(
                            model.studyDate.toKoreanFormat,
                            style: bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              _buildPopupMenuButton(),
            ],
          ),
        ));
  }

  _buildPopupMenuButton() {
    return Theme(
      data: ThemeData(useMaterial3: false),
      child: Builder(
        builder: (BuildContext context) {
          return Padding(
              padding: const EdgeInsets.all(4),
              child: _buildCustomMorePopupButton());
        },
      ),
    );
  }

  ClipRRect _buildCustomMorePopupButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Material(
        color: Colors.white.withOpacity(0.9),
        child: PopupMenuButton(
          itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<MoreSelections>>[
            PopupMenuItem<MoreSelections>(
              onTap: _onEditButtonTapped,
              child: const Text('수정'),
            ),
            PopupMenuItem<MoreSelections>(
              onTap: () => _onDeleteButtonTapped(context),
              child: const Text('삭제'),
            ),
          ],
          elevation: 2,
          child: Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey.shade500.withOpacity(0.1), width: 1),
                borderRadius: BorderRadius.circular(24)),
            child: const Icon(
              Icons.more_vert,
            ),
          ),
        ),
      ),
    );
  }
}

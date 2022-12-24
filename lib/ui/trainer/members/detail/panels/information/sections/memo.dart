import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/detail_vm.dart';
import 'package:si_hicoach_fe/ui/trainer/members/matching/memo/update/memo.dart';

class Memo extends StatelessWidget {
  Memo({Key? key}) : super(key: key);

  final MemberDetailViewModel _vm = Get.find<MemberDetailViewModel>();

  onEditIconPressed(BuildContext ctx) {
    Get.to(MemoEditView(matchingId: _vm.matchingId))
        ?.then((_) => _vm.refetch());
  }

  @override
  Widget build(BuildContext context) {
    String memo = _vm.memo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: TitleWithDescription(
                title: '메모',
                description: '회원님에 대해 기억해야 할 사항을 자유롭게 기록하세요.',
              ),
            ),
            IconButton(
              onPressed: () => onEditIconPressed(context),
              icon: const Icon(
                Icons.edit_sharp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextField(
              maxLength: 1000,
              minLines: 5,
              maxLines: 100,
              enabled: false,
              decoration: InputDecoration(
                hintText: memo,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 4,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

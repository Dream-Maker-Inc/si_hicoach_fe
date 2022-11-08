import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/alert_widget.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tickets/add_dialog.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tickets/remove_dialog.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleRemoveButtonPressed() {
      showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CustomAlertDialogWidget(
          title: 'PT 횟수 차감',
          content: const RemoveTicketDialog(),
          positiveText: '차감하기',
          onPositivePressed: () => Navigator.of(context).pop(),
          negativeText: '취소',
          onNegativePressed: () => Navigator.pop(context, true),
        ),
      );
    }

    handleAddButtonPressed() {
      showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CustomAlertDialogWidget(
          title: 'PT 횟수 추가',
          content: const EditTicketDialog(),
          positiveText: '추가하기',
          onPositivePressed: () => Navigator.of(context).pop(),
          negativeText: '취소',
          onNegativePressed: () => Navigator.pop(context, true),
        ),
      );
    }

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '수강권 관리'),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      'PT 총 횟수 : 30회',
                      style: bodyLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(smallPadding),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withAlpha(20),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: handleRemoveButtonPressed,
                        icon: const Icon(
                          Icons.remove_rounded,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      IconButton(
                        onPressed: handleAddButtonPressed,
                        icon: Icon(
                          Icons.add_rounded,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const ListTile(title: Text('PT 완료 횟수'), trailing: Text('30회')),
            const ListTile(title: Text('PT 잔여 횟수'), trailing: Text('30회')),
          ],
        ),
      ),
    );
  }
}

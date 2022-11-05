import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/alert_widget.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tickets/edit.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onTotalCountTapped(BuildContext context) {
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
        child: ListView(
          scrollDirection: Axis.vertical,
          children: ListTile.divideTiles(
            context: context,
            tiles: List.of(
              [
                ListTile(
                  onTap: () => onTotalCountTapped(context),
                  title: const Text('PT 총 횟수'),
                  subtitle: const Text('30회'),
                  trailing: const Icon(Icons.add_rounded),
                ),
                const ListTile(title: Text('PT 완료 횟수'), trailing: Text('30회')),
                const ListTile(title: Text('PT 잔여 횟수'), trailing: Text('30회')),
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }
}

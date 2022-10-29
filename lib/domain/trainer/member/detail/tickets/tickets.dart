import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/trainer/member/detail/tickets/edit.dart';

class TrainerMemberDetailTicketsView extends StatelessWidget {
  const TrainerMemberDetailTicketsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '수강권 관리',
        actionsWidget: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const TrainerMemberDetailTicketsEditView(),
                  ),
                );
              },
              icon: const Icon(Icons.edit_rounded)),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: ListTile.divideTiles(
            context: context,
            tiles: List.of(
              [
                ListTile(
                  title: const Text('PT 총 횟수'),
                  trailing: Text(
                    '30회',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                ListTile(
                  title: const Text('PT 완료 횟수'),
                  trailing: Text(
                    '30회',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                ListTile(
                  title: const Text('PT 잔여 횟수'),
                  trailing: Text(
                    '30회',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }
}

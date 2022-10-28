import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/trainer/member/detail/detail.dart';

class TrainerMemberStudyingListItemView extends StatelessWidget {
  const TrainerMemberStudyingListItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TrainerMemberDetailView(),
          ),
        );
      },
      title: Text(
        '9회차',
        style: Theme.of(context).textTheme.headline4,
      ),
      trailing: SizedBox(
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Text('2022년 8월 23일', style: TextStyle(color: Colors.grey)),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TrainerMemberDetailView(),
                  ),
                );
              },
              icon: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

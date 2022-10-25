import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/member/detail/detail.dart';

class StudyingListItemView extends StatelessWidget {
  const StudyingListItemView({Key? key}) : super(key: key);

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
      title: const Text(
        '이은석 회원님',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      subtitle: const Text(
        '등록일자 : 2021년 12월 11일',
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      trailing: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Text('5회차 (15회)', style: TextStyle(color: Colors.grey)),
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

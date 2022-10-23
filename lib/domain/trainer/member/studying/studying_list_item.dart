import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';

class StudyingListItemView extends StatelessWidget {
  const StudyingListItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('asdf');
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
              onPressed: () {},
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

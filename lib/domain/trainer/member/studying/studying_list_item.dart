import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';

class StudyingListItemView extends StatelessWidget {
  const StudyingListItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('tap');
      },
      child: Column(
        children: <Widget>[
          Divider(color: Colors.grey.shade300, height: 1, thickness: 1),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      '이은석 회원님',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '등록일자 : 2021년 12월 11일',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Text('5회차 (15회)',
                        style: TextStyle(color: Colors.grey)),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

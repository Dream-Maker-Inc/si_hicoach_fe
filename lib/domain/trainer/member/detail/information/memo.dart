import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/member/edit/memo.dart';

class TrainerMemberDetailMemo extends StatelessWidget {
  const TrainerMemberDetailMemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              '메모',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const TrainerMemberDetailEditMemoView(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(70, 103, 240, 0.1),
                ),
              ),
              icon: Icon(Icons.edit_sharp, color: colorScheme.primary),
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
                hintText: 'MEMOMEMOMEMOMEMOMEMOMEMOMEMOMEMOMEMOMEMOMEMOMEMO',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.primary,
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

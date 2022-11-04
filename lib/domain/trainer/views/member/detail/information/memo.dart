import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/edit/memo.dart';

class Memo extends StatelessWidget {
  const Memo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onEditButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const MemoEditView(),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('메모', style: Theme.of(context).textTheme.headline2),
            IconButton(
              onPressed: onEditButtonPressed,
              icon: const Icon(Icons.edit_sharp, color: Colors.grey),
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

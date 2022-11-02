import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

enum MoreSelections { edit, delete }

class InbodyItem extends StatelessWidget {
  const InbodyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black.withAlpha(10), width: 1),
        borderRadius: BorderRadius.circular(minPadding),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              'https://www.gymgair.co.uk/wp-content/uploads/2019/11/270rs-English.jpg',
            ),
          ),
          const CustomDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(smallPadding),
                child: Text(
                  '2022년 10월 11일',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<MoreSelections>>[
                  const PopupMenuItem<MoreSelections>(child: Text('수정')),
                  const PopupMenuItem<MoreSelections>(child: Text('삭제')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

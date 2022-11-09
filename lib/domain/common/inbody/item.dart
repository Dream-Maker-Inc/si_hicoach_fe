import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

enum MoreSelections { edit, delete }

class InbodyItem extends StatelessWidget {
  final String imageUrl;
  final String dateTime;

  const InbodyItem({
    Key? key,
    required this.imageUrl,
    required this.dateTime,
  }) : super(key: key);

  _onEditButtonTapped() {
    print('수정 클릭됨');
  }

  _onDeleteButtonTapped() {
    print('삭제 클릭됨');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black.withAlpha(10), width: 1),
        borderRadius: BorderRadius.circular(minPadding),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Image.network(imageUrl),
              ),
              const CustomDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(smallPadding),
                      child: Text(
                        dateTime.toString(),
                        style: bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<MoreSelections>>[
              PopupMenuItem<MoreSelections>(
                onTap: _onEditButtonTapped,
                child: const Text('수정'),
              ),
              PopupMenuItem<MoreSelections>(
                onTap: _onDeleteButtonTapped,
                child: const Text('삭제'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

class MemberMainHeader extends StatelessWidget {
  final String name;
  final String date;

  const MemberMainHeader({
    Key? key,
    required this.name,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(name, style: Theme.of(context).textTheme.headline4),
          Text(date, style: Theme.of(context).textTheme.headline4),
        ],
      ),
    );
  }
}

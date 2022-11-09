import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';

class CustomListTileWithArrow extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const CustomListTileWithArrow({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () => Navigator.pop(context),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}

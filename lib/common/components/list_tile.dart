import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';

class CustomListTileWithArrowModel {
  final String title;
  final String subtitle;

  CustomListTileWithArrowModel(this.title, this.subtitle);
}

class CustomListTileWithArrow extends StatelessWidget {
  final CustomListTileWithArrowModel model;
  final VoidCallback? onTap;

  const CustomListTileWithArrow({
    Key? key,
    required this.model,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () => Navigator.pop(context),
          title: Text(model.title),
          subtitle: Text(model.subtitle),
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

import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class EmptyDataPatch extends StatelessWidget {
  const EmptyDataPatch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 12,
          children: [
            const Opacity(
              opacity: 0.2,
              child: Icon(Icons.inventory_2_outlined),
            ),
            Opacity(opacity: 0.4, child: Text("데이터가 없어요!", style: bodySmall))
          ]),
    );
  }
}

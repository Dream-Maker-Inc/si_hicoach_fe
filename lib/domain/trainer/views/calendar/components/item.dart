import 'package:flutter/material.dart';

class WeeklyCalendarItem extends StatelessWidget {
  final String? name;
  const WeeklyCalendarItem({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    BoxDecoration itemBackground = BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(4),
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      height: 50,
      child: name != null
          ? Center(
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: itemBackground,
                child: Center(
                  child: Text(
                    name!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}

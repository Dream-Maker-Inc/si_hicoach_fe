import 'package:flutter/material.dart';

class MonthlyCalendarItem extends StatelessWidget {
  final int date;
  final String? name;
  const MonthlyCalendarItem({super.key, this.name, required this.date});

  @override
  Widget build(BuildContext context) {
    BoxDecoration itemBackground = BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(4),
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height / 5 - 22,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 4),
          Text(
            date.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 7,
            child: name != null
                ? Container(
                    margin: const EdgeInsets.only(top: 4, left: 4, right: 4),
                    padding: const EdgeInsets.all(2),
                    decoration: itemBackground,
                    child: Text(
                      name!,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

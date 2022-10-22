import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';

class TrainerStudyEditExerciseAddItem extends StatelessWidget {
  const TrainerStudyEditExerciseAddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          enableFeedback: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const <Widget>[
                          Text('벤치프레스', style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          Text('하체',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_right),
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

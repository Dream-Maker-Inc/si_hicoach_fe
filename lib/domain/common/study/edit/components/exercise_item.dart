import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/study/edit/components/text_field.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

class StudyEditExerciseItem extends StatelessWidget {
  const StudyEditExerciseItem({
    Key? key,
    required this.name,
    required this.weight,
    required this.count,
    required this.set,
  }) : super(key: key);

  final String name;
  final int weight;
  final int count;
  final int set;

  _handleWeightInputChanged(String value) {
    print('weight: $value');
  }

  _handleCountInputChanged(String value) {
    print('count: $value');
  }

  _handleSetInputChanged(String value) {
    print('set: $value');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: CustomDivider(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(name, style: bodyMedium),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      ExerciseTextField(
                        suffixText: 'KG',
                        labelText: '무게',
                        initialValue: weight,
                        onChanged: _handleWeightInputChanged,
                      ),
                      const SizedBox(width: 10),
                      ExerciseTextField(
                        suffixText: '회',
                        labelText: '횟수',
                        initialValue: count,
                        onChanged: _handleCountInputChanged,
                      ),
                      const SizedBox(width: 10),
                      ExerciseTextField(
                        suffixText: 'SET',
                        labelText: '세트',
                        initialValue: set,
                        onChanged: _handleSetInputChanged,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                  color: colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/study/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class ExerciseItemModel {
  int id;
  final String name;
  int weight;
  int count;
  int sets;

  ExerciseItemModel({
    required this.name,
    this.id = 0,
    this.weight = 0,
    this.count = 0,
    this.sets = 0,
  });
}

class StudyEditExerciseItemProps {
  ExerciseItemModel model;

  Function(int weight) onWeightChange;
  Function(int count) onCountChange;
  Function(int sets) onSetsChange;
  Function(int exerciseId) onDelete;

  StudyEditExerciseItemProps(
      {required this.model,
      required this.onWeightChange,
      required this.onCountChange,
      required this.onSetsChange,
      required this.onDelete});
}

class StudyEditExerciseItem extends StatelessWidget {
  const StudyEditExerciseItem({Key? key, required this.props})
      : super(key: key);

  final StudyEditExerciseItemProps props;

  // final ExerciseItemModel model;

  _handleWeightInputChanged(String value) {
    final v = int.tryParse(value) ?? 0;

    props.onWeightChange(v);
  }

  _handleCountInputChanged(String value) {
    final v = int.tryParse(value) ?? 0;

    props.onCountChange(v);
  }

  _handleSetInputChanged(String value) {
    final v = int.tryParse(value) ?? 0;

    props.onSetsChange(v);
  }

  _handleDeleteClick() {
    props.onDelete(props.model.id);
  }

  @override
  Widget build(BuildContext context) {
    final model = props.model;
    final name = model.name;
    final weight = model.weight;
    final count = model.count;
    final set = model.sets;

    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: CustomDivider(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(name,
                    style: bodyMedium.copyWith(color: Colors.grey.shade600)),
                IconButton(
                  onPressed: _handleDeleteClick,
                  icon: const Icon(Icons.close),
                  color: primaryColor,
                  iconSize: 16,
                ),
              ],
            ),
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
              ],
            ),
          ],
        ),
      ],
    );
  }
}

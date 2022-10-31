import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class StudyEditExerciseItem extends StatelessWidget {
  const StudyEditExerciseItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16),
        Divider(thickness: 1, height: 1, color: colorScheme.onTertiary),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('벤치프레스', style: TextStyle(fontSize: 20)),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 70,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffix: Text(
                        'KG',
                        style: TextStyle(color: colorScheme.primary),
                      ),
                      counterText: '',
                      label: const Text('무게'),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 70,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffix: Text(
                        '회',
                        style: TextStyle(color: colorScheme.primary),
                      ),
                      counterText: '',
                      label: const Text('횟수'),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 70,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffix: Text(
                        'set',
                        style: TextStyle(color: colorScheme.primary),
                      ),
                      counterText: '',
                      label: const Text('세트'),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
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

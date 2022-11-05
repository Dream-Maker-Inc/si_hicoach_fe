import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/components/list_tile.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

class ExerciseProps {
  final String name;
  final String category;

  ExerciseProps(this.name, this.category);
}

class StudyEditExerciseAdd extends StatelessWidget {
  StudyEditExerciseAdd({Key? key}) : super(key: key);

  final List<ExerciseProps> list = [
    ExerciseProps('벤치프레스', '하체'),
    ExerciseProps('벤치프레스', '하체'),
    ExerciseProps('벤치프레스', '하체'),
    ExerciseProps('벤치프레스', '하체'),
    ExerciseProps('벤치프레스', '하체'),
    ExerciseProps('벤치프레스', '하체'),
    ExerciseProps('벤치프레스', '하체'),
    ExerciseProps('벤치프레스', '하체'),
    ExerciseProps('벤치프레스', '하체'),
    ExerciseProps('벤치프레스', '하체'),
    ExerciseProps('벤치프레스', '하체'),
    ExerciseProps('벤치프레스', '하체'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '운동 추가'),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '검색어를 입력해 주세요.',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CustomDivider(),
            Expanded(
              flex: 1,
              child: ListView(
                children: List.of(
                  list.map(
                    (it) => CustomListTileWithArrow(
                      title: it.name,
                      subtitle: it.category,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

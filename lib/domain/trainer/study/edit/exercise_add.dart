import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/app_bar/arrow_back_icon.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/common/divider.dart';
import 'package:si_hicoach_fe/domain/common/list_tile.dart';

class TrainerStudyEditExerciseAdd extends StatelessWidget {
  const TrainerStudyEditExerciseAdd({Key? key}) : super(key: key);

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
                        icon: const Icon(Icons.search_rounded),
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
                children: List.generate(
                  20,
                  (int index) => const CustomListTileWithArrow(
                    title: '벤치프레스',
                    subtitle: '하체',
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

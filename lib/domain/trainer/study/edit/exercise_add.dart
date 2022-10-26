import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/app_bar/arrow_back_icon.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/study/edit/exercise_add_item.dart';

class TrainerStudyEditExerciseAdd extends StatelessWidget {
  const TrainerStudyEditExerciseAdd({Key? key}) : super(key: key);

  _handleSearchButtonPressed() {
    print('_handleSearchButtonPressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '운동 추가'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '검색어를 입력해 주세요.',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    suffix: IconButton(
                      onPressed: _handleSearchButtonPressed,
                      icon: const Icon(Icons.search),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const TrainerStudyEditExerciseAddItem(),
              const TrainerStudyEditExerciseAddItem(),
              const TrainerStudyEditExerciseAddItem(),
              const TrainerStudyEditExerciseAddItem(),
              const TrainerStudyEditExerciseAddItem(),
              const TrainerStudyEditExerciseAddItem(),
            ],
          ),
        ),
      ),
    );
  }
}

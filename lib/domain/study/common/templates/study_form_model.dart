import 'package:si_hicoach_fe/domain/study/common/components/exercise_item.dart';

class StudyFormModel {
  final int latestStudyRound;
  final int totalStudyCount;
  final List<ExerciseItemModel> exerciseItemModels;
  final String memo;
  late final DateTime startedAt;

  int get startedHour => startedAt.hour;

  StudyFormModel({
    required this.latestStudyRound,
    required this.totalStudyCount,
    this.exerciseItemModels = const [],
    this.memo = '',
    startedAt,
  }) {
    _initStartedAt(startedAt);
  }

  _initStartedAt(DateTime? initialDate) {
    if (initialDate != null) {
      startedAt = initialDate;
    } else {
      startedAt = DateTime.now();
    }
  }
}
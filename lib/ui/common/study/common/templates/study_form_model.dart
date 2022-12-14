import 'package:si_hicoach_fe/ui/common/study/common/components/exercise_item.dart';

class StudyFormModel {
  final int studyRound;
  final int ticketCount;
  final List<ExerciseItemModel> exerciseItemModels;
  final String memo;
  late final DateTime startedAt;

  int get startedHour => startedAt.hour;

  StudyFormModel({
    required this.studyRound,
    required this.ticketCount,
    this.exerciseItemModels = const [],
    this.memo = '',
    startedAt,
  }) {
    _initStartedAt(startedAt);
  }

  _initStartedAt(DateTime? initialDate) {
    if (initialDate != null) {
      return startedAt = initialDate;
    }

    startedAt = DateTime.now();
  }
}

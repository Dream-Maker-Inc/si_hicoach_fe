class WeekStudyItemModel {
  int studyId;
  String title;
  int weekDay;
  DateTime startedAt;
  DateTime endedAt;

  int get startedTime => startedAt.hour;
  int get startedDay => startedAt.day;
  int get endedTime => endedAt.hour;
  int get endedDay => endedAt.day;

  WeekStudyItemModel(
      {required this.studyId,
      required this.title,
      required this.weekDay,
      required this.startedAt,
      required this.endedAt});
}

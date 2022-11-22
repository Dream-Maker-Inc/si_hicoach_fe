class WeekStudyItemModel {
  int studyId;
  String memberName;
  int weekDay;
  DateTime startedAt;
  DateTime endedAt;

  int get startedTime => startedAt.hour;
  int get endedTime => endedAt.hour;

  WeekStudyItemModel(
      {required this.studyId,
      required this.memberName,
      required this.weekDay,
      required this.startedAt,
      required this.endedAt});
}

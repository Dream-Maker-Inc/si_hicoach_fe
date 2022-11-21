class LatestStudyModel {
  int id;
  int round;
  DateTime startedAt;
  int finishedStudyCount;
  int totalStudyCount;

  LatestStudyModel(
      {required this.id,
      required this.round,
      required this.startedAt,
      required this.finishedStudyCount,
      required this.totalStudyCount});
}

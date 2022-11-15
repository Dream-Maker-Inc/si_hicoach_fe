class LatestStudyModel {
  int id;
  DateTime startedAt;
  int finishedStudyCount;
  int totalStudyCount;

  LatestStudyModel(
      {required this.id,
      required this.startedAt,
      required this.finishedStudyCount,
      required this.totalStudyCount});
}

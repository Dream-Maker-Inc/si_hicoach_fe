class InBodyModel {
  final int studyId;
  final String studyAt;
  final String imageUrl;

  DateTime get studyDate => DateTime.parse(studyAt);

  InBodyModel(
      {required this.studyId, required this.imageUrl, required this.studyAt});
}

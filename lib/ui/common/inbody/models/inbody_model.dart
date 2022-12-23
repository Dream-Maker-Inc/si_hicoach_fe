class InBodyModel {
  final int inbodyId;
  final String registedAt;
  final String imageUrl;

  DateTime get registedDate => DateTime.parse(registedAt);

  InBodyModel({
    required this.inbodyId,
    required this.imageUrl,
    required this.registedAt,
  });
}

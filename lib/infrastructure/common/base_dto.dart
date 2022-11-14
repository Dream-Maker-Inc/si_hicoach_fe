class BaseDto {
  String createdAt;
  String updatedAt;
  String? deletedAt;

  BaseDto(
      {required this.createdAt,
      required this.updatedAt,
      required this.deletedAt});
}

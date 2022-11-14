class BaseDto {
  String createdAt;
  String updatedAt;
  String? deletedAt;

  BaseDto(this.createdAt, this.updatedAt, this.deletedAt);
}
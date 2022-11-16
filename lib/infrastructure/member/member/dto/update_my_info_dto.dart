class UpdateMyInfoDto {
  TrainerInfo trainerInfo;

  UpdateMyInfoDto(this.trainerInfo);

  Map<String, dynamic> toMap() => {'trainerInfo': trainerInfo.toMap()};
}

class TrainerInfo {
  String companyName;

  TrainerInfo(this.companyName);

  Map<String, dynamic> toMap() => {'companyName': companyName};
}

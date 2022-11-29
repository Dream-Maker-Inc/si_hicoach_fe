class AddDeviceDto {
  String uuid;
  String modelName;
  String deviceToken;

  AddDeviceDto(
      {required this.uuid, required this.modelName, required this.deviceToken});

  Map<String, dynamic> toMap() =>
      {'uuid': uuid, 'modelName': modelName, 'deviceToken': deviceToken};
}

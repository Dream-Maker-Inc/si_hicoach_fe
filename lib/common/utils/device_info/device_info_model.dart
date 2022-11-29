// 디바이스 정보 모델
class DeviceInfo {
  String uuid;
  String model;
  String token;

  DeviceInfo(this.uuid, this.model, this.token);

  Map<String, dynamic> toMap() {
    return {"uuid": uuid, "model": model, "token": token};
  }
}

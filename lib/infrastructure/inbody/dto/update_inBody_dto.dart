import 'package:dio/dio.dart';

class UpdateInBodyDto {
  List<MultipartFile> files;

  UpdateInBodyDto(this.files);

  toFormData() {
    return FormData.fromMap({'files': files});
  }
}

import 'package:dio/dio.dart';

class UploadTodayInBodyDto {
  int matchingId;
  List<MultipartFile> files;

  UploadTodayInBodyDto({required this.files, required this.matchingId});

  toFormData() {
    return FormData.fromMap({'matchingId': matchingId, 'files': files});
  }
}

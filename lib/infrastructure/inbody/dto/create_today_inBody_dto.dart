// ignore_for_file: file_names

import 'package:dio/dio.dart';

class CreateTodayInBodyDto {
  int memberId;

  List<MultipartFile> files;

  CreateTodayInBodyDto({required this.memberId, required this.files});

  toFormData() {
    return FormData.fromMap({'memberId': memberId, 'files': files});
  }
}

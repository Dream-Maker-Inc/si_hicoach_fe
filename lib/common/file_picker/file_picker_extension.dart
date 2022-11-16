import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

extension PlatformFileExtension on PlatformFile {
  Future<MultipartFile> get toMultipartFile async {
    final now = DateTime.now();

    return MultipartFile.fromFile(path!, filename: "${now.millisecond}_$name");
  }
}

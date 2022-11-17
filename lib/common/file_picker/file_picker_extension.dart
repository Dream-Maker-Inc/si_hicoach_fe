import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

extension PlatformFileExtension on PlatformFile {
  Future<MultipartFile> get toMultipartFile async {
    final now = DateTime.now();

    final contentType =
        MediaType.parse(lookupMimeType(extension ?? "") ?? "''/''");

    return MultipartFile.fromFile(path!,
        filename: "${now.millisecond}_$name", contentType: contentType);
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';

Future<FilePickerResult?> showFilePickerAndGet() async {
  return await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: false,
    onFileLoading: (FilePickerStatus status) {
      Logger().d('loading : $status');
    },
  );
}

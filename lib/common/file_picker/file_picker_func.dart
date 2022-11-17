import 'package:file_picker/file_picker.dart';

Future<FilePickerResult?> showFilePickerAndGet() async {
  return await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: false,
    onFileLoading: (FilePickerStatus status) => print('loading : $status'),
  );
}

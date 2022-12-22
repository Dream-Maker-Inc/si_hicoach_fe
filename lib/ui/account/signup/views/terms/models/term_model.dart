class TermModel {
  final int id;
  final String title;
  final String content;
  final bool isRequired;

  TermModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.isRequired});

  String get labeledTitle {
    String labelOfRequired = isRequired ? "[필수]" : "[선택]";
    String newTitle = '$labelOfRequired $title';

    return newTitle;
  }
}

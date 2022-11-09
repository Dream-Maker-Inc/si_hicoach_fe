class TermModel {
  final int id;
  final String title;
  final String content;
  final bool isRequired;

  TermModel(this.id, this.title, this.content, this.isRequired);

  String get labeledTitle {
    String labelOfRequired = isRequired ? "[필수]" : "[선택]";
    String newTitle = '$labelOfRequired $title';

    return newTitle;
  }
}
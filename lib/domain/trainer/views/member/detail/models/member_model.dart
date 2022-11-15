class MemberModel {
  int id;
  String name;
  DateTime birthDay;
  String gender;

  int get age {
    final now = DateTime.now();
    return now.year - birthDay.year;
  }

  MemberModel(
      {required this.id,
      required this.name,
      required this.birthDay,
      required this.gender});
}

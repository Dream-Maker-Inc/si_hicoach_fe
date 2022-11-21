class CreateStudyDto {
  int matchingId;
  String startedAt;
  String endedAt;
  String memo;
  List<MyExercises> myExercises;

  CreateStudyDto({
    required this.matchingId,
    required this.startedAt,
    required this.endedAt,
    required this.memo,
    required this.myExercises,
  });

  Map<String, dynamic> toMap() {
    return {
      'matchingId': matchingId,
      'startedAt': startedAt,
      'endedAt': endedAt,
      'memo': memo,
      'myExercises': myExercises.map((it) => it.toMap()).toList()
    };
  }
}

class MyExercises {
  int weight;
  int interval;
  int set;
  Exercise exercise;

  MyExercises(
      {required this.weight,
      required this.interval,
      required this.set,
      required this.exercise});

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'interval': interval,
      'set': set,
      'exercise': exercise.toMap()
    };
  }
}

class Exercise {
  int id;
  String title;
  String part;
  String type;

  Exercise(
      {required this.id,
      required this.title,
      required this.part,
      required this.type});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'part': part,
      'type': type,
    };
  }
}

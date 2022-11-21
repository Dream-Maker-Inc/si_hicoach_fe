class _BaseMutateStudyDto {
  String startedAt;
  String endedAt;
  String memo;
  List<MyExercises> myExercises;

  _BaseMutateStudyDto({
    required this.startedAt,
    required this.endedAt,
    required this.memo,
    required this.myExercises,
  });
}

class CreateStudyDto extends _BaseMutateStudyDto {
  int matchingId;

  CreateStudyDto({
    required this.matchingId,
    required super.startedAt,
    required super.endedAt,
    required super.memo,
    required super.myExercises,
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

class UpdateStudyDto extends _BaseMutateStudyDto {
  UpdateStudyDto({
    required super.startedAt,
    required super.endedAt,
    required super.memo,
    required super.myExercises,
  });

  Map<String, dynamic> toMap() {
    return {
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
  int exerciseId;

  MyExercises(
      {required this.weight,
      required this.interval,
      required this.set,
      required this.exerciseId});

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'interval': interval,
      'set': set,
      'exerciseId': exerciseId
    };
  }
}

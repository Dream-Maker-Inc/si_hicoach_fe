import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';
import 'package:si_hicoach_fe/infrastructure/common/meta_data_response.dart';

part 'get_member_studies_response.g.dart';

@JsonSerializable()
class GetMemberStudiesResponse extends BaseResponse<Data> {
  GetMemberStudiesResponse(
      {required super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory GetMemberStudiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMemberStudiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMemberStudiesResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.metaData,
    required this.items,
  });

  late final MetaData metaData;
  late final List<Items> items;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Items {
  Items(
      {required this.id,
      required this.round,
      required this.startedAt,
      required this.endedAt,
      required this.myExercises,
      required this.memo,
      required this.isFinished,
      this.inBody});

  late final int id;
  late final int round;
  late final String startedAt;
  late final String endedAt;
  late final List<MyExercises> myExercises;
  late final String memo;
  late final bool isFinished;
  late final InBody? inBody;

  DateTime get startedDate => DateTime.parse(startedAt);

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class MyExercises {
  MyExercises({
    required this.weight,
    required this.interval,
    required this.set,
    required this.exercise,
  });

  late final int weight;
  late final int interval;
  late final int set;
  late final Exercise exercise;

  factory MyExercises.fromJson(Map<String, dynamic> json) =>
      _$MyExercisesFromJson(json);

  Map<String, dynamic> toJson() => _$MyExercisesToJson(this);
}

@JsonSerializable()
class Exercise {
  Exercise({
    required this.title,
    required this.part,
    required this.type,
  });

  late final String title;
  late final String part;
  late final String type;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}

@JsonSerializable()
class InBody {
  InBody({
    required this.imageKey,
    required this.imageUrl,
    required this.createdAt,
  });

  late final String imageKey;
  late final String imageUrl;
  late final String createdAt;

  factory InBody.fromJson(Map<String, dynamic> json) => _$InBodyFromJson(json);

  Map<String, dynamic> toJson() => _$InBodyToJson(this);
}

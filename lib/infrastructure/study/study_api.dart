import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/mutation/mutate_study_dto.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_member_studies_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_member_study.response.dart';

class StudyApi {
  static Future<Result<Exception, bool>> createStudy(
    int matchingId,
    CreateStudyDto dto,
  ) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/matching/$matchingId/study';

      Logger().e(dto.toMap());

      final res = await dio.post(path, data: dto.toMap());

      if (res.data?['statusCode'] == StatusCode.existStudy.code) {
        return Error(ExistStudyException());
      }

      return const Success(true);
    });
  }

  static Future<Result<Exception, bool>> updateStudy(
    int matchingId,
    int studyId,
    UpdateStudyDto dto,
  ) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;

      String path = '/api/v4/matching/$matchingId/study/$studyId';

      final res = await dio.put(path, data: dto.toMap());

      if (res.data?['statusCode'] == StatusCode.existStudy.code) {
        return Error(ExistStudyException());
      }

      return const Success(true);
    });
  }

  static Future<Result<Exception, bool>> removeStudy(
    int matchingId,
    int studyId,
  ) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;

      String path = '/api/v4/matching/$matchingId/study/$studyId';

      await dio.delete(path);

      return const Success(true);
    });
  }

  // read
  static Future<Result<Exception, GetMemberStudiesResponse>> getMemberStudies(
      {required int matchingId}) async {
    return safeApiCall<GetMemberStudiesResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/matching/study';

      final response = await dio
          .get(path, queryParameters: {'matchingId': matchingId, 'size': 9999});

      return Success(GetMemberStudiesResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, GetStudyResponse>> findOne(
    int studyId,
  ) async {
    return safeApiCall<GetStudyResponse>(() async {
      Logger().w(studyId);

      Dio dio = DioHelper().dio;
      String path = '/api/v4/matching/study/$studyId';

      final res = await dio.get(path);

      if (res.data?['statusCode'] == StatusCode.notExist.code) {
        return Error(NotExistException());
      }

      return Success(GetStudyResponse.fromJson(res.data));
    });
  }
}

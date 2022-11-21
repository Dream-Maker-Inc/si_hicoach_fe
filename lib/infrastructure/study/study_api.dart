import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/mutation/mutate_study_dto.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_member_studies_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_member_study.response.dart';

class StudyApi {
  static Future<Result<Exception, GetMemberStudiesResponse>> getMemberStudies(
      {required int trainerId, required int memberId}) async {
    return safeApiCall<GetMemberStudiesResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/study';

      final response = await dio.get(path, queryParameters: {
        'trainerId': trainerId,
        'memberId': memberId,
        'size': 9999
      });

      return Success(GetMemberStudiesResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, GetStudyResponse>> findOne(
      int studyId) async {
    return safeApiCall<GetStudyResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/study/$studyId';

      final response = await dio.get(path);

      return Success(GetStudyResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, bool>> createStudy(CreateStudyDto dto) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;

      String path = '/api/v2/study';

      final res = await dio.post(path, data: dto.toMap());

      if (res.data?['statusCode'] == StatusCode.existStudy.code) {
        return Error(ExistStudyException());
      }

      return const Success(true);
    });
  }

  static Future<Result<Exception, bool>> updateStudy(
      int studyId, UpdateStudyDto dto) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;

      String path = '/api/v2/study/$studyId';

      await dio.put(path, data: dto.toMap());

      return const Success(true);
    });
  }

  static Future<Result<Exception, bool>> deleteStudy(int studyId) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;

      String path = '/api/v2/study/$studyId';

      await dio.delete(path);

      return const Success(true);
    });
  }
}

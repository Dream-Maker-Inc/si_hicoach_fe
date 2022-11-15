import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/create_matching_dto.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/create_matching_response.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/recover_matching_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_member_studies_response.dart';

class StudyApi {
  static Future<Result<Exception, GetMemberStudiesResponse>> getMemberStudies(
      {required int trainerId, required int memberId}) async {
    return safeApiCall<GetMemberStudiesResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/study';

      final response = await dio.get(path,
          queryParameters: {'trainerId': trainerId, 'memberId': memberId});

      return Success(GetMemberStudiesResponse.fromJson(response.data));
    });
  }
}

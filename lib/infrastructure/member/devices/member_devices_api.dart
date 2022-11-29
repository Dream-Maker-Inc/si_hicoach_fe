import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:si_hicoach_fe/infrastructure/member/devices/dto/add_device_dto.dart';

class MemberDevicesApi {
  static Future<Result<Exception, bool>> add(AddDeviceDto dto) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/member/devices';

      final response = await dio.post(path, data: dto.toMap());

      if (response.data?['statusCode'] == StatusCode.exist.code) {
        return Error(ExistException());
      }

      return const Success(true);
    });
  }
}

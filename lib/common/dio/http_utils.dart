import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';

typedef SafeApiCallResult<T> = Result<Exception, T>;
typedef FutureSafeApiCallResult<T> = Future<Result<Exception, T>>;

FutureSafeApiCallResult<T> safeApiCall<T>(
    FutureSafeApiCallResult<T> Function() request,
    {SafeApiCallResult<T> Function(DioError e)? handleError}) async {
  try {
    return await request();
  } on DioError catch (e) {
    final logger = Logger();
    logger.e(e.message, "Dio catch Error");
    logger.e(e.response?.data, "Dio catch Error");

    if (e.response?.statusCode == 401) return Error(UnauthorizedException());

    if (handleError != null) return handleError(e);

    return Error(Exception(e));
  } catch (e) {
    final logger = Logger();
    logger.e(e.toString(), "Generic Error");

    return Error(Exception(e));
  }
}

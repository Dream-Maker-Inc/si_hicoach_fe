class BaseResponse<T> {
  dynamic ref;
  T data;
  String statusCode;
  String message;

  BaseResponse(
      {required this.ref,
      required this.data,
      required this.statusCode,
      required this.message});
}

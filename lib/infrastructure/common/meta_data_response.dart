import 'package:json_annotation/json_annotation.dart';

part 'meta_data_response.g.dart';

@JsonSerializable()
class MetaData {
  int offset;
  int pageSize;
  int pageNumber;
  int totalPageCount;
  int itemCount;
  int totalItemCount;
  bool isFirst;
  bool isLast;

  MetaData(this.offset, this.pageSize, this.pageNumber, this.totalPageCount,
      this.itemCount, this.totalItemCount, this.isFirst, this.isLast);

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}

import 'package:intl/intl.dart';

extension IntExtension on int {
  /// to Korean Currency (세자리 수 콤마 처리)
  get toKC {
    return NumberFormat.currency(locale: 'ko-KR', symbol: '').format(this);
  }
}

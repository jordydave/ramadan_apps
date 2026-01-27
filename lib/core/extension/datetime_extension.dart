import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime? {
  String fromDate([String format = 'yyyy-MM-dd']) {
    if ((this) != null) {
      return DateFormat(format).format(this ?? DateTime.now());
    } else {
      return '';
    }
  }
}

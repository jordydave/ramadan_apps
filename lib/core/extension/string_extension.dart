import 'package:intl/intl.dart';

extension StringExtension on String? {
  DateTime toDate([String format = 'yyyy-MM-dd']) {
    final str = this ?? '';
    if (str.isNotEmpty) {
      try {
        return DateFormat(format).parse(str);
      } catch (e) {
        return DateTime.now();
      }
    } else {
      return DateTime.now();
    }
  }

  String formatDate([String format = 'yyyy-MM-dd']) {
    final str = this ?? '';
    if (str.isNotEmpty) {
      try {
        final date = DateTime.parse(str);
        return DateFormat(format, 'id').format(date);
      } catch (e) {
        final now = DateTime.now();
        return DateFormat(format, 'id').format(now);
      }
    } else {
      final now = DateTime.now();
      return DateFormat(format, 'id').format(now);
    }
  }

  String dateFormat({
    required String currentFormat,
    required String desiredFormat,
    bool useLocal = false,
  }) {
    if ((this) != null) {
      try {
        String formattedDate = "";
        DateTime dateTime = DateFormat(currentFormat).parse((this) ?? '', true);
        if (useLocal) {
          formattedDate = DateFormat(desiredFormat, 'id').format(dateTime);
        } else {
          formattedDate = DateFormat(desiredFormat).format(dateTime);
        }
        return formattedDate.toString();
      } catch (e) {
        return '';
      }
    } else {
      return '';
    }
  }

  String get api => '/$this';
}

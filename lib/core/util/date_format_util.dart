import 'package:intl/intl.dart';

class DateFormatUtil {
  static String formatMultipleDatesToCompact(List<DateTime> dates) {
    if (dates.isEmpty) return '';

    final sortedDates = List<DateTime>.from(dates)..sort();

    final Map<String, List<int>> groupedDates = {};
    for (final date in sortedDates) {
      final key = '${date.month.toString().padLeft(2, '0')}/${date.year}';
      if (!groupedDates.containsKey(key)) {
        groupedDates[key] = [];
      }
      groupedDates[key]!.add(date.day);
    }

    final List<String> formattedGroups = [];
    for (final entry in groupedDates.entries) {
      final days = entry.value.join(',');
      formattedGroups.add('$days/${entry.key}');
    }

    return formattedGroups.join('; ');
  }

  static List<DateTime>? parseMultipleDatesFromText(String text) {
    if (text.isEmpty) return null;

    try {
      final List<DateTime> dates = [];

      if (text.contains('/') && !text.contains(RegExp(r'[a-zA-Z]'))) {
        dates.addAll(_parseCompactFormat(text));
      } else {
        // Verbose format: "5 Desember 2025, 7 Desember 2025"
        dates.addAll(_parseVerboseFormat(text));
      }

      return dates.isEmpty ? null : dates;
    } catch (e) {
      return null;
    }
  }

  static List<DateTime> _parseCompactFormat(String text) {
    final List<DateTime> dates = [];
    final groups = text.split(';');

    for (final group in groups) {
      final trimmedGroup = group.trim();
      if (trimmedGroup.isEmpty) continue;

      final parts = trimmedGroup.split('/');
      if (parts.length == 3) {
        final days = parts[0].split(',');
        final month = int.tryParse(parts[1]);
        final year = int.tryParse(parts[2]);

        if (month != null && year != null) {
          for (final dayStr in days) {
            final day = int.tryParse(dayStr.trim());
            if (day != null) {
              dates.add(DateTime(year, month, day));
            }
          }
        }
      }
    }

    return dates;
  }

  static List<DateTime> _parseVerboseFormat(String text) {
    final List<DateTime> dates = [];
    final dateStrings = text.split(',');

    for (final dateStr in dateStrings) {
      final trimmed = dateStr.trim();
      if (trimmed.isEmpty) continue;

      try {
        dates.add(DateFormat('dd MMMM yyyy', 'id').parse(trimmed));
      } catch (e) {
        try {
          dates.add(DateFormat('dd MMM yyyy', 'id').parse(trimmed));
        } catch (e2) {
          rethrow;
        }
      }
    }

    return dates;
  }
}

import 'package:flutter/material.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/widgets/shared_date_picker_bottom_sheet.dart';

extension ContextExtension on BuildContext {
  Future<DateTimeRange?> dateRange({DateTime? start, DateTime? end}) async {
    var picked = await showDateRangePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDateRange: DateTimeRange(
        end: end ?? DateTime.now(),
        start: start ?? DateTime.now().subtract(const Duration(days: 14)),
      ),
      lastDate: DateTime.now(),
      firstDate: DateTime(2014),
      context: this,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.primaryColor,
              onPrimary: AppColor.blackColor,
              onSurface: AppColor.primaryColor,
            ),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );
    return picked;
  }

  Future<DateTime?> datePicker({
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    return await SharedDatePickerBottomSheet.show(
      context: this,
      initialDate: initialDate,
      firstDate: firstDate ?? DateTime(1900, 1, 1),
      lastDate: lastDate ?? DateTime.now(),
    );
  }

  Future<List<DateTime>?> datePickerMultiple({
    List<DateTime>? initialDates,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    return await SharedDatePickerBottomSheet.showMultiple(
      context: this,
      initialDates: initialDates,
      firstDate: firstDate ?? DateTime(1900, 1, 1),
      lastDate: lastDate ?? DateTime.now(),
    );
  }

  Future<DateTime?> selectDateTime({
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime? selectedDate = await showDatePicker(
      context: this,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1800, 1, 1),
      lastDate: lastDate ?? DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: const DialogThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            colorScheme: ColorScheme.light(
              primary: AppColor.primaryColor,
              onPrimary: AppColor.blackColor,
              onSurface: AppColor.primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );

    if (selectedDate == null) return null;
    final TimeOfDay? selectedTime = await showTimePicker(
      context: this,
      initialTime: TimeOfDay.fromDateTime(initialDate ?? DateTime.now()),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: const DialogThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            colorScheme: ColorScheme.light(
              primary: AppColor.primaryColor,
              onPrimary: AppColor.blackColor,
              onSurface: AppColor.primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );

    if (selectedTime == null) return null;
    final DateTime selectedDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    return selectedDateTime;
  }
}

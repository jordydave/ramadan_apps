import 'dart:ui';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';
import 'package:ramadan_apps/ui_kit/widgets/shared_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SharedDatePickerBottomSheet extends StatefulWidget {
  final DateTime? initialDate;
  final List<DateTime>? initialDates;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime)? onDateSelected;
  final Function(List<DateTime>)? onDatesSelected;
  final bool allowMultiple;

  const SharedDatePickerBottomSheet({
    super.key,
    this.initialDate,
    this.initialDates,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
    this.onDatesSelected,
    this.allowMultiple = false,
  });

  static Future<DateTime?> show({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    await initializeDateFormatting('id', null);

    if (!context.mounted) return null;

    DateTime? selectedDate;
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: SharedDatePickerBottomSheet(
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          allowMultiple: false,
          onDateSelected: (date) {
            selectedDate = date;
            Get.back();
          },
        ),
      ),
    );
    return selectedDate;
  }

  static Future<List<DateTime>?> showMultiple({
    required BuildContext context,
    List<DateTime>? initialDates,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    await initializeDateFormatting('id', null);

    if (!context.mounted) return null;

    List<DateTime>? selectedDates;
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: SafeArea(
          top: false,
          child: SharedDatePickerBottomSheet(
            initialDates: initialDates,
            firstDate: firstDate,
            lastDate: lastDate,
            allowMultiple: true,
            onDatesSelected: (dates) {
              selectedDates = dates;
              Get.back();
            },
          ),
        ),
      ),
    );
    return selectedDates;
  }

  @override
  State<SharedDatePickerBottomSheet> createState() =>
      _SharedDatePickerBottomSheetState();
}

class _SharedDatePickerBottomSheetState
    extends State<SharedDatePickerBottomSheet> {
  late DateTime _selectedDate;
  late DateTime _displayedMonth;
  final Set<DateTime> _selectedDates = {};

  @override
  void initState() {
    super.initState();
    if (widget.allowMultiple) {
      if (widget.initialDates != null) {
        _selectedDates.addAll(
          widget.initialDates!.map(
            (date) => DateTime(date.year, date.month, date.day),
          ),
        );
      }
      _selectedDate = _selectedDates.isNotEmpty
          ? _selectedDates.first
          : DateTime.now();
    } else {
      _selectedDate = widget.initialDate ?? DateTime.now();
    }
    _displayedMonth = DateTime(_selectedDate.year, _selectedDate.month);
  }

  void _onDateSelected(DateTime date) {
    if (widget.allowMultiple) {
      setState(() {
        final normalizedDate = DateTime(date.year, date.month, date.day);
        final existingDate = _selectedDates.firstWhere(
          (d) =>
              d.year == normalizedDate.year &&
              d.month == normalizedDate.month &&
              d.day == normalizedDate.day,
          orElse: () => DateTime(0),
        );
        if (existingDate.year != 0) {
          _selectedDates.remove(existingDate);
        } else {
          _selectedDates.add(normalizedDate);
        }
        _displayedMonth = DateTime(date.year, date.month);
      });
    } else {
      setState(() {
        _selectedDate = date;
        _displayedMonth = DateTime(date.year, date.month);
      });
    }
  }

  void _onConfirm() {
    if (widget.allowMultiple) {
      if (widget.onDatesSelected != null) {
        widget.onDatesSelected!(_selectedDates.toList()..sort());
      }
    } else {
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(_selectedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              'Pilih Tanggal',
              style: AppTextStyles.h4.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColor.textPrimary,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: widget.allowMultiple
                ? _CustomMultipleDateCalendar(
                    displayedMonth: _displayedMonth,
                    selectedDates: _selectedDates,
                    firstDate: widget.firstDate ?? DateTime(1900, 1, 1),
                    lastDate: widget.lastDate ?? DateTime.now(),
                    onDateSelected: _onDateSelected,
                    onMonthChanged: (month) {
                      setState(() {
                        _displayedMonth = month;
                      });
                    },
                  )
                : Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: AppColor.primaryColorLight,
                        onPrimary: AppColor.secondaryColor,
                        surface: Colors.white,
                        onSurface: AppColor.textPrimary,
                      ),
                      datePickerTheme: DatePickerThemeData(
                        headerHeadlineStyle: AppTextStyles.h5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.textPrimary,
                        ),
                        headerHelpStyle: AppTextStyles.h5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.textPrimary,
                        ),
                        dayStyle: AppTextStyles.h5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.textPrimary,
                        ),
                        yearStyle: AppTextStyles.h5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.textPrimary,
                        ),
                        rangePickerHeaderHeadlineStyle: AppTextStyles.h5
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.textPrimary,
                            ),
                        rangePickerHeaderHelpStyle: AppTextStyles.h5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.textPrimary,
                        ),
                      ),
                    ),
                    child: CalendarDatePicker(
                      key: ValueKey(
                        '${_displayedMonth.year}-${_displayedMonth.month}',
                      ),
                      initialDate:
                          _selectedDate.year == _displayedMonth.year &&
                              _selectedDate.month == _displayedMonth.month
                          ? _selectedDate
                          : DateTime(
                              _displayedMonth.year,
                              _displayedMonth.month,
                              1,
                            ),
                      firstDate: widget.firstDate ?? DateTime(1900, 1, 1),
                      lastDate: widget.lastDate ?? DateTime.now(),
                      onDateChanged: _onDateSelected,
                      currentDate: DateTime.now(),
                    ),
                  ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                Expanded(
                  child: SharedButton(
                    title: 'Tutup',
                    onPressed: () => Get.back(),
                    color: Colors.white,
                    borderColor: AppColor.secondaryColor,
                    textColor: AppColor.secondaryColor,
                  ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: SharedButton(
                    title: 'Pilih',
                    onPressed: _onConfirm,
                    color: AppColor.secondaryColor,
                    borderColor: AppColor.secondaryColor,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}

class _CustomMultipleDateCalendar extends StatelessWidget {
  final DateTime displayedMonth;
  final Set<DateTime> selectedDates;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime) onDateSelected;
  final Function(DateTime) onMonthChanged;

  const _CustomMultipleDateCalendar({
    required this.displayedMonth,
    required this.selectedDates,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
    required this.onMonthChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MonthYearHeader(
          displayedMonth: displayedMonth,
          onMonthChanged: onMonthChanged,
          firstDate: firstDate,
          lastDate: lastDate,
        ),
        SizedBox(height: 2.h),
        _WeekdayLabels(),
        SizedBox(height: 1.h),
        _CalendarGrid(
          displayedMonth: displayedMonth,
          selectedDates: selectedDates,
          firstDate: firstDate,
          lastDate: lastDate,
          onDateSelected: onDateSelected,
        ),
      ],
    );
  }
}

class _MonthYearHeader extends StatelessWidget {
  final DateTime displayedMonth;
  final Function(DateTime) onMonthChanged;
  final DateTime firstDate;
  final DateTime lastDate;

  const _MonthYearHeader({
    required this.displayedMonth,
    required this.onMonthChanged,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    final monthName = DateFormat('MMMM yyyy', 'id').format(displayedMonth);
    final canGoPrevious = DateTime(
      displayedMonth.year,
      displayedMonth.month,
      1,
    ).isAfter(DateTime(firstDate.year, firstDate.month, 1));
    final canGoNext = DateTime(
      displayedMonth.year,
      displayedMonth.month,
      1,
    ).isBefore(DateTime(lastDate.year, lastDate.month, 1));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          monthName,
          style: AppTextStyles.h5.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColor.textPrimary,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: canGoPrevious
                    ? AppColor.textPrimary
                    : AppColor.greyColor,
              ),
              onPressed: canGoPrevious
                  ? () {
                      final previousMonth = DateTime(
                        displayedMonth.year,
                        displayedMonth.month - 1,
                        1,
                      );
                      onMonthChanged(previousMonth);
                    }
                  : null,
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
            SizedBox(width: 2.w),
            IconButton(
              icon: Icon(
                Icons.chevron_right,
                color: canGoNext ? AppColor.textPrimary : AppColor.greyColor,
              ),
              onPressed: canGoNext
                  ? () {
                      final nextMonth = DateTime(
                        displayedMonth.year,
                        displayedMonth.month + 1,
                        1,
                      );
                      onMonthChanged(nextMonth);
                    }
                  : null,
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
          ],
        ),
      ],
    );
  }
}

class _WeekdayLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekdays
          .map(
            (day) => Expanded(
              child: Center(
                child: Text(
                  day,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.greyColor600,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  final DateTime displayedMonth;
  final Set<DateTime> selectedDates;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime) onDateSelected;

  const _CalendarGrid({
    required this.displayedMonth,
    required this.selectedDates,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
  });

  List<DateTime?> _generateCalendarDays() {
    final firstDayOfMonth = DateTime(
      displayedMonth.year,
      displayedMonth.month,
      1,
    );
    final lastDayOfMonth = DateTime(
      displayedMonth.year,
      displayedMonth.month + 1,
      0,
    );

    final firstWeekday = firstDayOfMonth.weekday % 7;
    final daysInMonth = lastDayOfMonth.day;

    final List<DateTime?> days = [];

    for (int i = 0; i < firstWeekday; i++) {
      days.add(null);
    }

    for (int day = 1; day <= daysInMonth; day++) {
      days.add(DateTime(displayedMonth.year, displayedMonth.month, day));
    }

    return days;
  }

  @override
  Widget build(BuildContext context) {
    final days = _generateCalendarDays();
    final rows = <Widget>[];

    for (int i = 0; i < days.length; i += 7) {
      final weekDays = days.sublist(
        i,
        i + 7 > days.length ? days.length : i + 7,
      );

      while (weekDays.length < 7) {
        weekDays.add(null);
      }

      rows.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: weekDays
                .map(
                  (date) => Expanded(
                    child: date != null
                        ? _DateCell(
                            date: date,
                            isSelected: selectedDates.any(
                              (d) =>
                                  d.year == date.year &&
                                  d.month == date.month &&
                                  d.day == date.day,
                            ),
                            isDisabled:
                                date.isBefore(
                                  DateTime(
                                    firstDate.year,
                                    firstDate.month,
                                    firstDate.day,
                                  ),
                                ) ||
                                date.isAfter(
                                  DateTime(
                                    lastDate.year,
                                    lastDate.month,
                                    lastDate.day,
                                  ),
                                ),
                            isToday: _isToday(date),
                            onTap: () => onDateSelected(date),
                          )
                        : SizedBox(),
                  ),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(children: rows);
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}

class _DateCell extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final bool isDisabled;
  final bool isToday;
  final VoidCallback onTap;

  const _DateCell({
    required this.date,
    required this.isSelected,
    required this.isDisabled,
    required this.isToday,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.transparent;
    Color textColor = AppColor.textPrimary;

    if (isDisabled) {
      textColor = AppColor.greyColor;
    } else if (isSelected) {
      backgroundColor = AppColor.secondaryColor.withValues(alpha: 0.1);
      textColor = AppColor.secondaryColor;
    }

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: 40,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '${date.day}',
            style: AppTextStyles.body.copyWith(
              color: textColor,
              fontWeight: isToday && !isSelected
                  ? FontWeight.w700
                  : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

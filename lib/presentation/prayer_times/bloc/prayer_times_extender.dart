import 'package:get/get.dart';
import 'package:ramadan_apps/core/case/case.dart';

part 'prayer_times_bloc.dart';

mixin class _Extender {
  final prayerTimesState = Rx<Case<List<Map<String, dynamic>>>>(InitialCase());

  // Dummy data for Header
  final location = 'London, UK'.obs;
  final hijriDate = '14 Ramadan 1445 AH'.obs;

  // Dummy data for Next Prayer Card
  final nextPrayerName = 'Asr'.obs;
  final nextPrayerTime = '03:45 PM'.obs;
  final countdownDuration = const Duration(
    hours: 1,
    minutes: 22,
    seconds: 45,
  ).obs;
}

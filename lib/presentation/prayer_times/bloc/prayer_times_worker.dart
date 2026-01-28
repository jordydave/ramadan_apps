import 'package:flutter/material.dart'; // Added
import 'package:get/get.dart';
import 'package:ramadan_apps/core/case/case.dart'; // Added
import 'package:ramadan_apps/core/get_state/get_state.dart'; // Added - usually needed for GetState
import 'package:ramadan_apps/ui_kit/text_styles.dart'; // Added
import 'package:ramadan_apps/presentation/prayer_times/components/next_prayer_card.dart'; // Added
import 'package:ramadan_apps/presentation/prayer_times/components/prayer_time_card.dart'; // Added
import 'package:ramadan_apps/presentation/prayer_times/bloc/prayer_times_extender.dart';

part 'package:ramadan_apps/presentation/prayer_times/prayer_times_page.dart';

mixin class _Worker {
  final bloc = Get.put(PrayerTimesBloc());
}

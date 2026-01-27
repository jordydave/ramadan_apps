import 'package:ramadan_apps/app_dependencies.dart';
import 'package:ramadan_apps/apps_initial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await initializeDateFormatting('id', null);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await AppDependencies.init;
  runApp(const AppsInitial());
}

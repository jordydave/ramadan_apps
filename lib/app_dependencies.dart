import 'package:ramadan_apps/core/core_dependencies.dart';
import 'package:ramadan_apps/data/data_dependencies.dart';
import 'package:ramadan_apps/domain/domain_dependencies.dart';
import 'package:ramadan_apps/network/http_logger/dev_tree.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependencies {
  static Future<void> get init async {
    if (kReleaseMode == false) Fimber.plantTree(DevTree());
    final pref = await SharedPreferences.getInstance();
    final info = await PackageInfo.fromPlatform();
    CoreDependencies(sharedPreferences: pref, packageInfo: info);
    DataDependencies();
    DomainDependencies();
  }
}

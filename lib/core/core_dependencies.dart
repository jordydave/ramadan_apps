import 'package:ramadan_apps/network/http_logger/http_inspector.dart';
import 'package:ramadan_apps/network/http_util/http_util.dart';
import 'package:ramadan_apps/network/http_util/http_util_impl.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoreDependencies {
  CoreDependencies({
    required SharedPreferences sharedPreferences,
    required PackageInfo packageInfo,
  }) {
    Get.put<SharedPreferences>(sharedPreferences);
    Get.put<PackageInfo>(packageInfo);
    Get.put(HttpInspector());
    Get.put<HttpUtil>(HttpUtilImpl(httpInspector: Get.find()), permanent: true);
    Get.find<HttpInspector>().initialize();
  }
}

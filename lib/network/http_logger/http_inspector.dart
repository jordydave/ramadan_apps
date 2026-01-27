import 'package:alice_lightweight/alice.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shake/shake.dart';

class HttpInspector {
  Interceptor get interceptor => _alice.getDioInterceptor();
  final _alice = Alice();

  void initialize() {
    _alice.setNavigatorKey(Get.key);
    ShakeDetector.autoStart(onPhoneShake: (_) => _alice.showInspector());
  }
}

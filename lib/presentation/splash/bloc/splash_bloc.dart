part of 'splash_extender.dart';

class SplashBloc extends GetxController with _Extender {
  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 2));
    isInitialized(true);
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    final route = Util.getInitialRoute();
    Get.offAllNamed(route);
  }
}

import 'package:get/get.dart';
import 'package:ramadan_apps/presentation/splash/bloc/splash_extender.dart';
import 'package:ramadan_apps/presentation/splash/splash_worker.dart';
import 'package:ramadan_apps/presentation/home/bloc/home_extender.dart';
import 'package:ramadan_apps/presentation/home/home_worker.dart';

class Routes {
  static List<GetPage> get list {
    return [
      GetPage(
        name: SplashPage.page,
        page: () => SplashPage(),
        binding: BindingsBuilder(() {
          Get.put(SplashBloc());
        }),
      ),
      GetPage(
        name: HomePage.page,
        page: () => HomePage(),
        binding: BindingsBuilder(() {
          Get.put(HomeBloc());
        }),
      ),
    ];
  }
}

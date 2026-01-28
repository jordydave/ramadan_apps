import 'package:get/get.dart';
import 'package:ramadan_apps/presentation/splash/bloc/splash_extender.dart';
import 'package:ramadan_apps/presentation/splash/splash_worker.dart';
import 'package:ramadan_apps/presentation/home/bloc/home_extender.dart';
import 'package:ramadan_apps/presentation/home/home_worker.dart';
import 'package:ramadan_apps/presentation/surat/surat_list/bloc/surat_list_extender.dart';
import 'package:ramadan_apps/presentation/surat/surat_list/surat_list_worker.dart';
import 'package:ramadan_apps/presentation/surat/surat_detail/surat_detail_worker.dart';
import 'package:ramadan_apps/presentation/surat/surat_detail/bloc/surat_detail_extender.dart';
import 'package:ramadan_apps/presentation/doa/doa_list/bloc/doa_list_worker.dart';
import 'package:ramadan_apps/presentation/doa/doa_list/bloc/doa_list_extender.dart';

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
      GetPage(
        name: SuratListPage.page,
        page: () => SuratListPage(),
        binding: BindingsBuilder(() {
          Get.put(SuratListBloc());
        }),
      ),
      GetPage(
        name: SuratDetailPage.page,
        page: () => SuratDetailPage(),
        binding: BindingsBuilder(() {
          Get.put(SuratDetailBloc());
        }),
      ),
      GetPage(
        name: DoaListPage.page,
        page: () => DoaListPage(),
        binding: BindingsBuilder(() {
          Get.put(DoaListBloc());
        }),
      ),
    ];
  }
}

import 'package:ramadan_apps/presentation/home/home_worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadan_apps/core/routes/routes.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppsInitial extends StatelessWidget {
  final ThemeMode initialThemeMode;
  const AppsInitial({super.key, this.initialThemeMode = ThemeMode.system});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, device) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                return GetMaterialApp(
                  defaultTransition: Transition.cupertino,
                  debugShowCheckedModeBanner: false,
                  navigatorKey: Get.key,
                  initialRoute: HomePage.page,
                  getPages: Routes.list,
                  theme: ThemeData(
                    scaffoldBackgroundColor: AppColor.whiteColor,
                    brightness: Brightness.light,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    appBarTheme: AppBarTheme(
                      backgroundColor: AppColor.whiteColor,
                      elevation: 0,
                      centerTitle: false,
                      systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarBrightness: Brightness.light,
                        statusBarColor: Colors.transparent,
                      ),
                    ),
                  ),
                  darkTheme: ThemeData(
                    scaffoldBackgroundColor: Colors.black,
                    brightness: Brightness.dark,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.black,
                      elevation: 0,
                      centerTitle: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarBrightness: Brightness.dark,
                        statusBarColor: Colors.transparent,
                      ),
                    ),
                  ),
                  themeMode: ThemeMode.light,
                  builder: (context, child) {
                    return child ?? const SizedBox();
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

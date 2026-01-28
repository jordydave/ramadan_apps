import 'dart:async';

import 'package:ramadan_apps/presentation/splash/splash_worker.dart';
import 'package:ramadan_apps/ui_kit/widgets/shared_confirmation_dialog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ramadan_apps/core/case/case.dart';
import 'package:ramadan_apps/core/extension/get_extension.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class Util {
  static String formatViews(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (m) => '.',
    );
  }

  static Worker listen<T>({
    required RxInterface<Case<T>> listener,
    required WorkerCallback<Case<T>> callback,
    bool withLoading = true,
  }) {
    StreamSubscription sub = listener.listen((event) {
      if (withLoading) Util.loading(event);
      callback(event);
    });
    return Worker(sub.cancel, '[ever]');
  }

  static void loading(Case state) {
    if (state is LoadingCase) {
      Get.closeLoading();
      Get.showLoading();
    } else if (state is LoadedCase || state is ErrorCase) {
      Get.closeLoading();
    }
  }

  static Future<XFile?> get pickImageGallery async {
    // Check for photos permission first (Android 13+)
    var status = await Permission.photos.status;
    if (status.isGranted) {
      return await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    // If photos permission is not available, check storage permission
    if (status.isPermanentlyDenied || status.isDenied) {
      status = await Permission.storage.status;
      if (status.isGranted) {
        return await ImagePicker().pickImage(source: ImageSource.gallery);
      }
    }

    // Try requesting photos permission first
    var granted = await Permission.photos.request().isGranted;
    if (!granted) {
      // If photos permission fails, try storage permission
      granted = await Util.reqPermission(Permission.storage);
    }

    if (granted) {
      return await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      return null;
    }
  }

  static Future<XFile?> get pickImageCamera async {
    final status = await Permission.camera.status;
    if (status.isGranted) {
      return await ImagePicker().pickImage(source: ImageSource.camera);
    }

    final granted = await Util.reqPermission(Permission.camera);
    if (granted) {
      return await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      return null;
    }
  }

  static Future<bool> reqPermission(Permission permission) async {
    if (await permission.request().isGranted) {
      return true;
    } else {
      var media = '';
      if (permission == Permission.camera) {
        media = 'Camera';
      } else if (permission == Permission.storage ||
          permission == Permission.photos) {
        media = "Gallery";
      }
      await Get.dialog(
        SharedConfirmationDialog(
          title: "Permission Needed",
          error: 'Sorry $media Permission is Required',
          noButton: "Close",
          yesButton: "Open Settings",
        ),
      ).then((value) async {
        if (value == true) {
          await openAppSettings();
        }
      });

      return false;
    }
  }

  static Future<void> requestMediaPermissions() async {
    await Permission.camera.request();
    // Request photos permission for Android 13+, falls back to storage for older versions
    await Permission.photos.request();
    await Permission.storage.request();
  }

  static String formatTimeAgoId(DateTime dateTime, {DateTime? now}) {
    final DateTime reference = now ?? DateTime.now();
    Duration diff = reference.difference(dateTime);
    if (diff.isNegative) diff = Duration.zero;

    if (diff.inSeconds < 60) {
      return 'Baru saja';
    } else if (diff.inMinutes < 60) {
      final m = diff.inMinutes;
      return m == 1 ? '1 menit yang lalu' : '$m menit yang lalu';
    } else if (diff.inHours < 24) {
      final h = diff.inHours;
      return h == 1 ? '1 jam yang lalu' : '$h jam yang lalu';
    } else if (diff.inDays < 30) {
      final d = diff.inDays;
      return d == 1 ? '1 hari yang lalu' : '$d hari yang lalu';
    } else if (diff.inDays < 365) {
      final mo = (diff.inDays / 30).floor();
      return mo <= 1 ? '1 bulan yang lalu' : '$mo bulan yang lalu';
    } else {
      final y = (diff.inDays / 365).floor();
      return y <= 1 ? '1 tahun yang lalu' : '$y tahun yang lalu';
    }
  }

  static Future<bool> openUrl(Uri url, {bool external = true}) async {
    try {
      if (!await canLaunchUrl(url)) return false;
      final bool ok = await launchUrl(
        url,
        mode: external
            ? LaunchMode.externalApplication
            : LaunchMode.platformDefault,
      );
      return ok;
    } catch (_) {
      return false;
    }
  }

  static String getInitialRoute() {
    return SplashPage.page;
  }

  static void clearAuthAndNavigateToLogin() {
    final storage = GetStorage();
    storage.remove('user_id');
    storage.remove('access_token');

    Get.closeLoading();

    // Get.offAllNamed(LoginPage.page);
  }

  static String formatDateId(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd MMMM yyyy', 'id').format(date);
    } catch (e) {
      return dateString;
    }
  }

  static String formatDateEn(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('d MMMM yyyy', 'en_US').format(date);
    } catch (e) {
      return '';
    }
  }

  static String formatDateCustom(
    String? dateString, {
    String format = 'dd MMMM yyyy',
    String locale = 'id',
  }) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat(format, locale).format(date);
    } catch (e) {
      return dateString;
    }
  }

  static String getMonthNameId(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMMM', 'id').format(date);
    } catch (e) {
      return '';
    }
  }

  static String getYear(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('yyyy', 'id').format(date);
    } catch (e) {
      return '';
    }
  }
}

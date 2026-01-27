import 'dart:ui';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum DocumentSource { camera, gallery, file }

class SharedDocumentSourceBottomSheet extends StatelessWidget {
  final Function(DocumentSource) onSourceSelected;

  const SharedDocumentSourceBottomSheet({
    super.key,
    required this.onSourceSelected,
  });

  static Future<DocumentSource?> show({required BuildContext context}) async {
    DocumentSource? selectedSource;
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: SharedDocumentSourceBottomSheet(
          onSourceSelected: (source) {
            selectedSource = source;
            Get.back();
          },
        ),
      ),
    );
    return selectedSource;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                'Pilih Sumber Dokumen',
                style: AppTextStyles.h4.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColor.textPrimary,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            _SourceOption(
              icon: Icons.camera_alt_rounded,
              title: 'Ambil Foto',
              subtitle: 'Gunakan kamera untuk mengambil foto dokumen',
              onTap: () => onSourceSelected(DocumentSource.camera),
            ),
            Divider(
              height: 1,
              color: AppColor.greyColor.withValues(alpha: 0.3),
            ),
            _SourceOption(
              icon: Icons.photo_library_rounded,
              title: 'Pilih dari Galeri',
              subtitle: 'Pilih dokumen dari galeri foto',
              onTap: () => onSourceSelected(DocumentSource.gallery),
            ),
            Divider(
              height: 1,
              color: AppColor.greyColor.withValues(alpha: 0.3),
            ),
            _SourceOption(
              icon: Icons.insert_drive_file_rounded,
              title: 'Pilih File',
              subtitle: 'Pilih file PDF atau gambar dari penyimpanan',
              onTap: () => onSourceSelected(DocumentSource.file),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}

class _SourceOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SourceOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColor.secondaryColor, size: 6.w),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.h5.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColor.textPrimary,
                    ),
                  ),
                  SizedBox(height: 0.4.h),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColor.greyColor600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColor.greyColor,
              size: 4.w,
            ),
          ],
        ),
      ),
    );
  }
}

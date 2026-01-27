import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';
import 'package:flutter/material.dart';

class SharedAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final bool showBack;
  const SharedAppbar({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return _buildAppBar(context);
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              color: AppColor.whiteColor,
              onPressed: () {
                Navigator.maybePop(context);
              },
            )
          : null,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.h5.copyWith(color: AppColor.whiteColor),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: AppTextStyles.body.copyWith(color: AppColor.whiteColor),
            ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

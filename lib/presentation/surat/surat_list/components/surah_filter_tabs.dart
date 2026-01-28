import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadan_apps/presentation/surat/surat_list/bloc/surat_list_extender.dart';
import 'package:ramadan_apps/ui_kit/colors.dart';
import 'package:ramadan_apps/ui_kit/text_styles.dart';

class SurahFilterTabs extends StatelessWidget {
  final SuratListBloc bloc;
  const SurahFilterTabs({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Obx(() {
        return Row(
          children: [
            _TabItem(
              label: 'Surah',
              isSelected: bloc.selectedFilter.value == 0,
              onTap: () => bloc.selectedFilter.value = 0,
            ),
            _TabItem(
              label: 'Juz',
              isSelected: bloc.selectedFilter.value == 1,
              onTap: () => bloc.selectedFilter.value = 1,
            ),
            _TabItem(
              label: 'Hizb',
              isSelected: bloc.selectedFilter.value == 2,
              onTap: () => bloc.selectedFilter.value = 2,
            ),
          ],
        );
      }),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.secondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.body.copyWith(
                color: isSelected ? Colors.white : AppColor.greyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

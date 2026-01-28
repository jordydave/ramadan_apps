part of '../home_worker.dart';

class _QuickActionButtons extends StatelessWidget {
  const _QuickActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _QuickActionItem(
          icon: Icons.list_alt,
          label: 'Index',
          onTap: () {
            Get.toNamed(SuratListPage.page);
          },
        ),
        _QuickActionItem(
          icon: Icons.menu_book_outlined,
          label: 'Doa',
          onTap: () {
            Get.toNamed(DoaListPage.page);
          },
        ),
        _QuickActionItem(icon: Icons.bookmark, label: 'Saved'),
        _QuickActionItem(icon: Icons.search, label: 'Search'),
      ],
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _QuickActionItem({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: AppColor.secondaryColor, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 12, // slightly smaller
            ),
          ),
        ],
      ),
    );
  }
}

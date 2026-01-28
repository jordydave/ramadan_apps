part of '../home_worker.dart';

class _PopularReciters extends StatelessWidget {
  const _PopularReciters();

  @override
  Widget build(BuildContext context) {
    final reciters = [
      {'name': 'Mishary', 'image': 'https://i.pravatar.cc/150?u=Mishary'},
      {'name': 'Abdul Basit', 'image': 'https://i.pravatar.cc/150?u=Abdul'},
      {'name': 'Al-Sudais', 'image': 'https://i.pravatar.cc/150?u=Sudais'},
      {'name': 'Al-Husary', 'image': 'https://i.pravatar.cc/150?u=Husary'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Popular Reciters', style: AppTextStyles.h4),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: reciters
              .map(
                (data) =>
                    _ReciterItem(name: data['name']!, imageUrl: data['image']!),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ReciterItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const _ReciterItem({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: Colors.white, width: 2), // Ring effect
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: AppTextStyles.caption.copyWith(
            color: AppColor.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

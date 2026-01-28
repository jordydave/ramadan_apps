part of '../home_worker.dart';

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Salam Alaykum,', style: AppTextStyles.subtitle2),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Rayhan',
              style: AppTextStyles.h1.copyWith(color: AppColor.secondaryColor),
            ),
          ],
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColor.primaryColorLight,
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: NetworkImage('https://i.pravatar.cc/150?u=Rayhan'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

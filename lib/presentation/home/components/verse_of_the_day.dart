part of '../home_worker.dart';

class _VerseOfTheDay extends StatelessWidget {
  const _VerseOfTheDay();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Verse of the Day', style: AppTextStyles.h4),
            Text(
              'View All',
              style: AppTextStyles.body.copyWith(
                color: AppColor.secondaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            // Background bloom effect placeholder
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColorLight.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'AL-KAHF: 46',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.share_outlined, color: Colors.grey, size: 20),
                      SizedBox(width: 12),
                      Icon(
                        Icons.favorite,
                        color: Colors.grey,
                        size: 20,
                      ), // Using grey for now
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Arabic Text
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الْمَالُ وَالْبَنُونَ زِينَةُ الْحَيَاةِ الدُّنْيَا',
                  style: AppTextStyles.h1.copyWith(
                    fontFamily: 'Amiri', // Assuming a font, or fallback
                    height: 1.8,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '"Wealth and children are an adornment of the life of this world..."',
                style: AppTextStyles.bodySmall.copyWith(
                  fontStyle: FontStyle.italic,
                  color: AppColor.greyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

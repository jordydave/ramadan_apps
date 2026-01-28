part of 'home_worker.dart';

class HomePage extends GetState<HomeBloc> with _Worker {
  static const page = '/home_page';
  HomePage({super.key});

  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<HomeBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) => _Body(bloc: controller),
    );
  }
}

class _Body extends StatelessWidget {
  final HomeBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HomeHeader(),
              const SizedBox(height: 24),
              const _LastReadCard(),
              const SizedBox(height: 24),
              const _QuickActionButtons(),
              const SizedBox(height: 24),
              const _VerseOfTheDay(),
              const SizedBox(height: 24),
              const _PopularReciters(),
            ],
          ),
        ),
      ),
    );
  }
}

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

class _LastReadCard extends StatelessWidget {
  const _LastReadCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [AppColor.secondaryColor, const Color(0xFF0089BA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.secondaryColor.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.menu_book, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                'Last Read',
                style: AppTextStyles.body.copyWith(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Surah Al-Kahf',
                    style: AppTextStyles.h2.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ayah 46',
                    style: AppTextStyles.body.copyWith(color: Colors.white70),
                  ),
                ],
              ),
              // Play button
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: AppColor.goldColor,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Juz 15',
                style: AppTextStyles.caption.copyWith(color: Colors.white),
              ),
              Text(
                '65%',
                style: AppTextStyles.caption.copyWith(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Progress Bar
          Stack(
            children: [
              Container(
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.65,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColor.goldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionButtons extends StatelessWidget {
  const _QuickActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _QuickActionItem(icon: Icons.list_alt, label: 'Index'),
        _QuickActionItem(
          icon: Icons.menu_book_outlined,
          label: 'Juz',
        ), // Using similar icons
        _QuickActionItem(icon: Icons.bookmark, label: 'Saved'),
        _QuickActionItem(icon: Icons.search, label: 'Search'),
      ],
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickActionItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

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

class _PopularReciters extends StatelessWidget {
  const _PopularReciters();

  @override
  Widget build(BuildContext context) {
    // Mock Data
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

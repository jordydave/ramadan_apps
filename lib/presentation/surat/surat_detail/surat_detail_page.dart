part of 'surat_detail_worker.dart';

class SuratDetailPage extends GetState<SuratDetailBloc> with _Worker {
  static const page = '/surat_detail_page';

  SuratDetailPage({super.key});

  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.primaryColor),
          onPressed: () => Get.back(),
        ),
        title: Column(
          children: [
            Text(
              "Surah Al-Kahf",
              style: AppTextStyles.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              "THE CAVE",
              style: AppTextStyles.overline.copyWith(
                color: AppColor.secondaryColor,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: AppColor.primaryColor),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const DetailHeader(),
                const SizedBox(height: 16),
                _buildMockAyah(1),
                _buildMockAyah(2),
                _buildMockAyah(3),
                const SizedBox(height: 100), // Space for bottom player
              ],
            ),
          ),
          const AudioPlayerBar(),
        ],
      ),
    );
  }

  Widget _buildMockAyah(int number) {
    return AyahItem(
      number: number,
      arabic:
          'الْحَمْدُ لِلَّهِ الَّذِي أَنزَلَ عَلَى عَبْدِهِ الْكِتَابَ وَلَمْ يَجْعَل لَّهُ عِوَجَا',
      translation:
          'All praise is for Allah Who has revealed the Book to His servant, allowing no crookedness in it.',
    );
  }
}

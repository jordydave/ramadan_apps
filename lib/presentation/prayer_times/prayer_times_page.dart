part of 'bloc/prayer_times_worker.dart';

class PrayerTimesPage extends GetState<PrayerTimesBloc> with _Worker {
  static const page = '/prayer_times';

  PrayerTimesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light grey bg
      body: Stack(
        children: [
          // Green Header Background
          Container(
            height: 280,
            decoration: const BoxDecoration(
              color: Color(0xFF00796B), // Teal/Green color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        _buildNextPrayerCard(),
                        const SizedBox(height: 24),
                        _buildPrayerTimesList(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Obx(
                () => Text(
                  bloc.location.value,
                  style: AppTextStyles.h5.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Obx(
            () => Text(
              bloc.hijriDate.value,
              style: AppTextStyles.body.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextPrayerCard() {
    return Obx(() {
      return NextPrayerCard(
        nextPrayerName: bloc.nextPrayerName.value,
        nextPrayerTime: bloc.nextPrayerTime.value,
        countdownDuration: bloc.countdownDuration.value,
      );
    });
  }

  Widget _buildPrayerTimesList() {
    return Obx(() {
      final state = bloc.prayerTimesState.value;

      if (state is LoadingCase) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (state is LoadedCase<List<Map<String, dynamic>>>) {
        final data = state.data ?? [];
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = data[index];
            return PrayerTimeCard(
              name: item['name'],
              time: item['time'],
              status: item['status'],
              iconType: item['icon'],
            );
          },
        );
      }

      return const SizedBox();
    });
  }
}

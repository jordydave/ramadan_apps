part of 'bloc/doa_detail_worker.dart';

class DoaDetailPage extends GetState<DoaDetailBloc> with _Worker {
  static const page = '/doa_detail';

  DoaDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Obx(() {
          final state = bloc.doaDetailState.value;
          if (state is LoadedCase<Doa>) {
            return Text(
              state.data?.nama ?? 'Doa Detail',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          }
          return const Text(
            'Doa Detail',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          );
        }),
        centerTitle: true,
      ),
      body: Obx(() {
        final state = bloc.doaDetailState.value;

        if (state is LoadingCase) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorCase || state is ExceptionCase) {
          return Center(
            child: Text(state.failure?.toString() ?? 'Unknown error'),
          );
        } else if (state is LoadedCase<Doa>) {
          final doa = state.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Column(
                children: [
                  // Decorative Divider Top (Optional based on image)
                  Container(
                    height: 4,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Arabic Text
                  Text(
                    doa.ar,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.amiri(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 2.2,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Divider
                  Container(
                    width: 100,
                    height: 1,
                    color: const Color(0xFFE0E0E0),
                  ),
                  const SizedBox(height: 24),

                  // Transliteration (Teal Color)
                  Text(
                    doa.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitle1.copyWith(
                      color: const Color(0xFF00BFA5), // Teal/Cyan color
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Translation (Indonesia)
                  Text(
                    doa.idn,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      color: AppColor.greyColor,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Translation (English - if available but API provides IDN, relying on 'translation' field if mapped)
                  // Assuming IDN is mapped to 'translation' in generic DoaCard usage, but here we use specific fields.
                  const SizedBox(height: 32),

                  // Reference / Tentang
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      doa.tentang.split('\n').first, // Take first line/source
                      style: AppTextStyles.caption.copyWith(
                        color: AppColor.greyColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      }),
    );
  }
}

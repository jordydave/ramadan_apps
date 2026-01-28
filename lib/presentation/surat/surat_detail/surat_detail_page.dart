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
    return GetStateBuilder<SuratDetailBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: AppColor.primaryColor),
              onPressed: () => Get.back(),
            ),
            title: Obx(() {
              final data = bloc.surahDetail.value;
              if (data == null) return const SizedBox();
              return Column(
                children: [
                  Text(
                    "Surah ${data.namaLatin}",
                    style: AppTextStyles.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Text(
                    data.arti.toUpperCase(),
                    style: AppTextStyles.overline.copyWith(
                      color: AppColor.secondaryColor,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              );
            }),
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
          body: Obx(() {
            final state = bloc.userDataState.value;
            if (state is LoadingCase) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorCase) {
              return Center(child: Text(state.failure.toString()));
            } else if (state is LoadedCase) {
              final data = bloc.surahDetail.value;
              if (data == null) return const SizedBox();
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: data.ayat.length + 1, // +1 for Header
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const Column(
                            children: [DetailHeader(), SizedBox(height: 16)],
                          );
                        }
                        final ayat = data.ayat[index - 1]; // Offset by 1
                        return AyahItem(
                          number: ayat.nomorAyat,
                          arabic: ayat.teksArab,
                          translation: ayat.teksIndonesia,
                        );
                      },
                    ),
                  ),
                  const AudioPlayerBar(),
                ],
              );
            }
            return const SizedBox();
          }),
        );
      },
    );
  }
}

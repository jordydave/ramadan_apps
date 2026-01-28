part of 'surat_list_worker.dart';

class SuratListPage extends GetState<SuratListBloc> with _Worker {
  static const page = '/surat_list_page';
  SuratListPage({super.key});

  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<SuratListBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) => _Body(bloc: controller),
    );
  }
}

class _Body extends StatelessWidget {
  final SuratListBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: SurahSearchBar(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SurahFilterTabs(bloc: bloc),
            ),
            Expanded(
              child: Obx(() {
                final state = bloc.userDataState.value;
                if (state is LoadingCase) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ErrorCase) {
                  return Center(child: Text(state.failure.toString()));
                } else if (state is LoadedCase) {
                  final data = bloc.listSurah;
                  return RefreshIndicator(
                    onRefresh: () => bloc.fetchSurah(forceRefresh: true),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(24),
                      itemCount: data.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final surah = data[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              SuratDetailPage.page,
                              arguments: surah.nomor,
                            );
                          },
                          child: SurahItem(
                            number: surah.nomor,
                            name: surah.namaLatin,
                            meaning: surah.arti,
                            ayas: surah.jumlahAyat,
                            type: surah.tempatTurun == 'Mekah'
                                ? 'Meccan'
                                : 'Medinan',
                            arabicName: surah.nama,
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox();
              }),
            ),
          ],
        ),
      ),
    );
  }
}

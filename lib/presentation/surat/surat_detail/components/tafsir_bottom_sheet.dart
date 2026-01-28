import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadan_apps/core/case/case.dart';
import 'package:ramadan_apps/presentation/surat/surat_detail/bloc/surat_detail_extender.dart';

class TafsirBottomSheet extends StatelessWidget {
  final SuratDetailBloc bloc;
  final int surahId;

  const TafsirBottomSheet({
    super.key,
    required this.bloc,
    required this.surahId,
  });

  @override
  Widget build(BuildContext context) {
    // Fetch info when opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.fetchTafsir(surahId);
    });

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tafsir',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              final state = bloc.tafsirState.value;

              if (state is LoadingCase) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ErrorCase) {
                return Center(child: Text(state.failure.toString()));
              } else if (state is LoadedCase) {
                final tafsirList = bloc.tafsirList;
                if (tafsirList.isEmpty) {
                  return const Center(child: Text('No Tafsir available'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: tafsirList.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = tafsirList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ayat ${item.ayat}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.teks,
                          style: const TextStyle(fontSize: 14),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    );
                  },
                );
              }
              return const SizedBox();
            }),
          ),
        ],
      ),
    );
  }
}

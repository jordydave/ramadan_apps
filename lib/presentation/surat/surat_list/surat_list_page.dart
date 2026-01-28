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
              child: ListView.separated(
                padding: const EdgeInsets.all(24),
                itemCount: 6, // Mock data count
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  // Mock Data for UI
                  final mockData = [
                    {
                      'number': 1,
                      'name': 'Al-Fatiha',
                      'meaning': 'The Opening',
                      'ayas': 7,
                      'type': 'Meccan',
                      'arabic': 'الفاتحة',
                    },
                    {
                      'number': 2,
                      'name': 'Al-Baqarah',
                      'meaning': 'The Cow',
                      'ayas': 286,
                      'type': 'Medinan',
                      'arabic': 'البقرة',
                    },
                    {
                      'number': 3,
                      'name': "Ali 'Imran",
                      'meaning': 'Family of Imran',
                      'ayas': 200,
                      'type': 'Medinan',
                      'arabic': 'آل عمران',
                    },
                    {
                      'number': 4,
                      'name': 'An-Nisa',
                      'meaning': 'The Women',
                      'ayas': 176,
                      'type': 'Medinan',
                      'arabic': 'النساء',
                    },
                    {
                      'number': 5,
                      'name': "Al-Ma'idah",
                      'meaning': 'The Table Spread',
                      'ayas': 120,
                      'type': 'Medinan',
                      'arabic': 'المائدة',
                    },
                    {
                      'number': 6,
                      'name': "Al-An'am",
                      'meaning': 'The Cattle',
                      'ayas': 165,
                      'type': 'Meccan',
                      'arabic': 'الأنعام',
                    },
                  ];
                  final data = mockData[index];
                  return SurahItem(
                    number: data['number'] as int,
                    name: data['name'] as String,
                    meaning: data['meaning'] as String,
                    ayas: data['ayas'] as int,
                    type: data['type'] as String,
                    arabicName: data['arabic'] as String,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

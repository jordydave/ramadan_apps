part of 'prayer_times_extender.dart';

class PrayerTimesBloc extends GetxController with _Extender {
  final GetProvinsiListUseCase _getProvinsiListUseCase = Get.find();

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
    fetchProvinsiList();
  }

  void fetchProvinsiList() async {
    provinsiListState.value = LoadingCase();
    final result = await _getProvinsiListUseCase();
    result.fold((error) => provinsiListState.value = ErrorCase(error), (data) {
      provinsiListState.value = LoadedCase(data);
      if (data.isNotEmpty && !data.contains(selectedProvinsi.value)) {
        selectedProvinsi.value = data.first;
      }
    });
  }

  void updateProvinsi(String provinsi) {
    selectedProvinsi.value = provinsi;
    // TODO: Fetch prayer times for new province
  }

  void loadDummyData() {
    prayerTimesState.value = LoadingCase();

    // Simulate API delay
    Future.delayed(const Duration(milliseconds: 500), () {
      final dummyList = [
        {
          'name': 'Fajr',
          'time': '04:30 AM',
          'status': 'Completed',
          'icon': 'moon',
        },
        {
          'name': 'Sunrise',
          'time': '06:15 AM',
          'status': 'None',
          'icon': 'sun',
        },
        {
          'name': 'Dhuhr',
          'time': '01:15 PM',
          'status': 'Completed',
          'icon': 'sun',
        },
        {
          'name': 'Asr',
          'time': '03:45 PM',
          'status': 'Next Prayer',
          'icon': 'sun_cloud',
        },
        {
          'name': 'Maghrib',
          'time': '07:22 PM',
          'status': 'Upcoming',
          'icon': 'moon',
        },
        {
          'name': 'Isha',
          'time': '09:00 PM',
          'status': 'Upcoming',
          'icon': 'moon',
        },
      ];
      prayerTimesState.value = LoadedCase(dummyList);
    });
  }
}

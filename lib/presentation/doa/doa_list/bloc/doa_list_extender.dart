import 'package:get/get.dart';
import 'package:ramadan_apps/core/case/case.dart';

part 'doa_list_bloc.dart';

mixin class _Extender {
  final userDataState = Rx<Case>(InitialCase());
  final selectedCategory = RxInt(0);

  // Dummy Categories
  final categories = [
    'All',
    'Daily',
    'Morning & Evening',
    'Prayer',
    'Hajj & Umrah',
  ];

  // Dummy Doa Data
  final doaList = <Map<String, dynamic>>[
    {
      'title': 'Upon Waking Up',
      'arabic':
          'الْحَمْدُ للهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
      'translation':
          'All praise is for Allah who gave us life after having taken it from us and unto Him is the resurrection.',
    },
    {
      'title': 'Wearing a Garment',
      'arabic':
          'الْحَمْدُ للهِ الَّذِي كَسَانِي هَذَا (الثَّوْبَ) وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ',
      'translation':
          'All Praise is for Allah who has clothed me with this (garment) and provided it for me, with no power or might from myself.',
    },
  ].obs;
}

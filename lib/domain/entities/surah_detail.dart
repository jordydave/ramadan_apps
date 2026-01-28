import 'package:ramadan_apps/domain/entities/ayat.dart';
import 'package:ramadan_apps/domain/entities/surah.dart';

class SurahDetail extends Surah {
  final List<Ayat> ayat;
  final Surah? suratSelanjutnya;
  final Surah? suratSebelumnya;

  SurahDetail({
    required super.nomor,
    required super.nama,
    required super.namaLatin,
    required super.jumlahAyat,
    required super.tempatTurun,
    required super.arti,
    required super.deskripsi,
    required super.audioFull,
    required this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });
}

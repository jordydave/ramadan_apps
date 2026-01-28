import 'package:ramadan_apps/data/dto/ayat_dto.dart';
import 'package:ramadan_apps/data/dto/surah_dto.dart';
import 'package:ramadan_apps/domain/entities/surah_detail.dart';

class SurahDetailDto {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final Map<String, String> audioFull;
  final List<AyatDto> ayat;
  final SurahDto? suratSelanjutnya;
  final SurahDto? suratSebelumnya;

  SurahDetailDto({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
    required this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory SurahDetailDto.fromJson(Map<String, dynamic> json) {
    return SurahDetailDto(
      nomor: json['nomor'] as int? ?? 0,
      nama: json['nama'] as String? ?? '',
      namaLatin: json['namaLatin'] as String? ?? '',
      jumlahAyat: json['jumlahAyat'] as int? ?? 0,
      tempatTurun: json['tempatTurun'] as String? ?? '',
      arti: json['arti'] as String? ?? '',
      deskripsi: json['deskripsi'] as String? ?? '',
      audioFull:
          (json['audioFull'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, v as String),
          ) ??
          {},
      ayat:
          (json['ayat'] as List<dynamic>?)
              ?.map((e) => AyatDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      suratSelanjutnya: json['suratSelanjutnya'] is Map<String, dynamic>
          ? SurahDto.fromJson(json['suratSelanjutnya'] as Map<String, dynamic>)
          : null,
      suratSebelumnya: json['suratSebelumnya'] is Map<String, dynamic>
          ? SurahDto.fromJson(json['suratSebelumnya'] as Map<String, dynamic>)
          : null,
    );
  }

  SurahDetail toEntity() {
    return SurahDetail(
      nomor: nomor,
      nama: nama,
      namaLatin: namaLatin,
      jumlahAyat: jumlahAyat,
      tempatTurun: tempatTurun,
      arti: arti,
      deskripsi: deskripsi,
      audioFull: audioFull,
      ayat: ayat.map((e) => e.toEntity()).toList(),
      suratSelanjutnya: suratSelanjutnya?.toEntity(),
      suratSebelumnya: suratSebelumnya?.toEntity(),
    );
  }
}

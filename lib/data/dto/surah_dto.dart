import 'package:ramadan_apps/domain/entities/surah.dart';

class SurahDto {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final Map<String, String> audioFull;

  SurahDto({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
  });

  factory SurahDto.fromJson(Map<String, dynamic> json) {
    return SurahDto(
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
    );
  }

  Surah toEntity() {
    return Surah(
      nomor: nomor,
      nama: nama,
      namaLatin: namaLatin,
      jumlahAyat: jumlahAyat,
      tempatTurun: tempatTurun,
      arti: arti,
      deskripsi: deskripsi,
      audioFull: audioFull,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nomor': nomor,
      'nama': nama,
      'namaLatin': namaLatin,
      'jumlahAyat': jumlahAyat,
      'tempatTurun': tempatTurun,
      'arti': arti,
      'deskripsi': deskripsi,
      'audioFull': audioFull,
    };
  }
}

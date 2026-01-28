import 'package:ramadan_apps/domain/entities/tafsir.dart';

class TafsirDto {
  final int ayat;
  final String teks;

  TafsirDto({required this.ayat, required this.teks});

  factory TafsirDto.fromJson(Map<String, dynamic> json) {
    return TafsirDto(ayat: json['ayat'] as int, teks: json['teks'] as String);
  }

  Tafsir toEntity() {
    return Tafsir(ayat: ayat, teks: teks);
  }
}

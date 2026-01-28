import 'package:ramadan_apps/domain/entities/doa.dart';

class DoaDto extends Doa {
  DoaDto({
    required super.id,
    required super.grup,
    required super.nama,
    required super.ar,
    required super.tr,
    required super.idn,
    required super.tentang,
    required super.tag,
  });

  factory DoaDto.fromJson(Map<String, dynamic> json) {
    return DoaDto(
      id: json['id'] as int,
      grup: json['grup'] as String? ?? '',
      nama: json['nama'] as String? ?? '',
      ar: json['ar'] as String? ?? '',
      tr: json['tr'] as String? ?? '',
      idn: json['idn'] as String? ?? '',
      tentang: json['tentang'] as String? ?? '',
      tag:
          (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'grup': grup,
      'nama': nama,
      'ar': ar,
      'tr': tr,
      'idn': idn,
      'tentang': tentang,
      'tag': tag,
    };
  }

  Doa toEntity() {
    return Doa(
      id: id,
      grup: grup,
      nama: nama,
      ar: ar,
      tr: tr,
      idn: idn,
      tentang: tentang,
      tag: tag,
    );
  }
}

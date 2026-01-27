class Reason {
  final int id;
  final String nama;
  final String kategori;
  final bool requireAttachment;

  Reason({
    this.id = 0,
    this.nama = '',
    this.kategori = '',
    this.requireAttachment = false,
  });

  factory Reason.fromJson(Map<String, dynamic> json) {
    return Reason(
      id: json['id'] ?? 0,
      nama: json['nama'] ?? '',
      kategori: json['kategori'] ?? '',
      requireAttachment: json['requireAttachment'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'kategori': kategori,
      'requireAttachment': requireAttachment,
    };
  }
}

class ReasonList {
  final List<Reason> data;

  ReasonList({List<Reason>? data}) : data = data ?? [];

  factory ReasonList.fromJson(Map<String, dynamic> json) {
    return ReasonList(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Reason.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

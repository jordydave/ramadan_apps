class Submission {
  final num id;
  final String reason;
  final String kategori;
  final num jumlah;
  final String status;
  final String reviewStatus;
  final String indicatorColor;
  final List<String> submissionDates;
  final String keterangan;
  final String? attachmentUrl;
  final String? googleDriveFileId;
  final String createdAt;
  final String? reviewedAt;
  final String? adminNotes;

  Submission({
    this.id = 0,
    this.reason = '',
    this.kategori = '',
    this.jumlah = 0,
    this.status = '',
    this.reviewStatus = '',
    this.indicatorColor = '',
    List<String>? submissionDates,
    this.keterangan = '',
    this.attachmentUrl,
    this.googleDriveFileId,
    this.createdAt = '',
    this.reviewedAt,
    this.adminNotes,
  }) : submissionDates = submissionDates ?? [];

  factory Submission.fromJson(Map<String, dynamic> json) {
    return Submission(
      id: json['id'] ?? 0,
      reason: json['reason'] ?? '',
      kategori: json['kategori'] ?? '',
      jumlah: json['jumlah'] ?? 0,
      status: json['status'] ?? '',
      reviewStatus: json['reviewStatus'] ?? '',
      indicatorColor: json['indicatorColor'] ?? '',
      submissionDates:
          (json['submissionDates'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      keterangan: json['keterangan'] ?? '',
      attachmentUrl: json['attachmentUrl'],
      googleDriveFileId: json['googleDriveFileId'],
      createdAt: json['createdAt'] ?? '',
      reviewedAt: json['reviewedAt'],
      adminNotes: json['adminNotes'],
    );
  }
}

class SubmissionList {
  final List<Submission> data;
  final SubmissionMeta meta;

  SubmissionList({List<Submission>? data, SubmissionMeta? meta})
    : data = data ?? [],
      meta = meta ?? SubmissionMeta();

  factory SubmissionList.fromJson(Map<String, dynamic> json) {
    return SubmissionList(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Submission.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      meta: SubmissionMeta.fromJson(json['meta'] ?? {}),
    );
  }
}

class SubmissionMeta {
  final num page;
  final num limit;
  final num total;
  final num totalPages;

  SubmissionMeta({
    this.page = 1,
    this.limit = 10,
    this.total = 0,
    this.totalPages = 1,
  });

  factory SubmissionMeta.fromJson(Map<String, dynamic> json) {
    return SubmissionMeta(
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 10,
      total: json['total'] ?? 0,
      totalPages: json['totalPages'] ?? 1,
    );
  }
}

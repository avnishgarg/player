class Previews {
  String? previewHqMp3;
  String? previewHqOgg;
  String? previewLqMp3;
  String? previewLqOgg;

  Previews({
    this.previewHqMp3,
    this.previewHqOgg,
    this.previewLqMp3,
    this.previewLqOgg,
  });

  factory Previews.fromJson(Map<String, dynamic> json) => Previews(
        previewHqMp3: json['preview-hq-mp3'] as String?,
        previewHqOgg: json['preview-hq-ogg'] as String?,
        previewLqMp3: json['preview-lq-mp3'] as String?,
        previewLqOgg: json['preview-lq-ogg'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'preview-hq-mp3': previewHqMp3,
        'preview-hq-ogg': previewHqOgg,
        'preview-lq-mp3': previewLqMp3,
        'preview-lq-ogg': previewLqOgg,
      };
}

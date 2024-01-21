class SongInfo {
  int? id;
  String? url;
  String? name;
  List<String>? tags;
  String? description;
  String? geotag;
  String? created;
  String? license;
  String? type;
  int? channels;
  int? filesize;
  int? bitrate;
  int? bitdepth;
  double? duration;
  double? samplerate;
  String? username;
  String? pack;
  String? packName;
  String? download;
  String? bookmark;
  Previews? previews;
  Images? images;
  int? numDownloads;
  double? avgRating;
  int? numRatings;
  String? rate;
  String? comments;
  int? numComments;
  String? comment;
  String? similarSounds;
  String? analysis;
  String? analysisFrames;
  String? analysisStats;
  bool? isExplicit;

  SongInfo(
      {this.id,
      this.url,
      this.name,
      this.tags,
      this.description,
      this.geotag,
      this.created,
      this.license,
      this.type,
      this.channels,
      this.filesize,
      this.bitrate,
      this.bitdepth,
      this.duration,
      this.samplerate,
      this.username,
      this.pack,
      this.packName,
      this.download,
      this.bookmark,
      this.previews,
      this.images,
      this.numDownloads,
      this.avgRating,
      this.numRatings,
      this.rate,
      this.comments,
      this.numComments,
      this.comment,
      this.similarSounds,
      this.analysis,
      this.analysisFrames,
      this.analysisStats,
      this.isExplicit});

  SongInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    tags = json['tags'].cast<String>();
    description = json['description'];
    geotag = json['geotag'];
    created = json['created'];
    license = json['license'];
    type = json['type'];
    channels = json['channels'];
    filesize = json['filesize'];
    bitrate = json['bitrate'];
    bitdepth = json['bitdepth'];
    duration = json['duration'];
    samplerate = json['samplerate'];
    username = json['username'];
    pack = json['pack'];
    packName = json['pack_name'];
    download = json['download'];
    bookmark = json['bookmark'];
    previews = json['previews'] != null
        ? new Previews.fromJson(json['previews'])
        : null;
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    numDownloads = json['num_downloads'];
    avgRating = json['avg_rating'];
    numRatings = json['num_ratings'];
    rate = json['rate'];
    comments = json['comments'];
    numComments = json['num_comments'];
    comment = json['comment'];
    similarSounds = json['similar_sounds'];
    analysis = json['analysis'];
    analysisFrames = json['analysis_frames'];
    analysisStats = json['analysis_stats'];
    isExplicit = json['is_explicit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    data['tags'] = this.tags;
    data['description'] = this.description;
    data['geotag'] = this.geotag;
    data['created'] = this.created;
    data['license'] = this.license;
    data['type'] = this.type;
    data['channels'] = this.channels;
    data['filesize'] = this.filesize;
    data['bitrate'] = this.bitrate;
    data['bitdepth'] = this.bitdepth;
    data['duration'] = this.duration;
    data['samplerate'] = this.samplerate;
    data['username'] = this.username;
    data['pack'] = this.pack;
    data['pack_name'] = this.packName;
    data['download'] = this.download;
    data['bookmark'] = this.bookmark;
    if (this.previews != null) {
      data['previews'] = this.previews!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['num_downloads'] = this.numDownloads;
    data['avg_rating'] = this.avgRating;
    data['num_ratings'] = this.numRatings;
    data['rate'] = this.rate;
    data['comments'] = this.comments;
    data['num_comments'] = this.numComments;
    data['comment'] = this.comment;
    data['similar_sounds'] = this.similarSounds;
    data['analysis'] = this.analysis;
    data['analysis_frames'] = this.analysisFrames;
    data['analysis_stats'] = this.analysisStats;
    data['is_explicit'] = this.isExplicit;
    return data;
  }
}

class Previews {
  String? previewHqMp3;
  String? previewHqOgg;
  String? previewLqMp3;
  String? previewLqOgg;

  Previews(
      {this.previewHqMp3,
      this.previewHqOgg,
      this.previewLqMp3,
      this.previewLqOgg});

  Previews.fromJson(Map<String, dynamic> json) {
    previewHqMp3 = json['preview-hq-mp3'];
    previewHqOgg = json['preview-hq-ogg'];
    previewLqMp3 = json['preview-lq-mp3'];
    previewLqOgg = json['preview-lq-ogg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preview-hq-mp3'] = this.previewHqMp3;
    data['preview-hq-ogg'] = this.previewHqOgg;
    data['preview-lq-mp3'] = this.previewLqMp3;
    data['preview-lq-ogg'] = this.previewLqOgg;
    return data;
  }
}

class Images {
  String? waveformM;
  String? waveformL;
  String? spectralM;
  String? spectralL;
  String? waveformBwM;
  String? waveformBwL;
  String? spectralBwM;
  String? spectralBwL;

  Images(
      {this.waveformM,
      this.waveformL,
      this.spectralM,
      this.spectralL,
      this.waveformBwM,
      this.waveformBwL,
      this.spectralBwM,
      this.spectralBwL});

  Images.fromJson(Map<String, dynamic> json) {
    waveformM = json['waveform_m'];
    waveformL = json['waveform_l'];
    spectralM = json['spectral_m'];
    spectralL = json['spectral_l'];
    waveformBwM = json['waveform_bw_m'];
    waveformBwL = json['waveform_bw_l'];
    spectralBwM = json['spectral_bw_m'];
    spectralBwL = json['spectral_bw_l'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['waveform_m'] = this.waveformM;
    data['waveform_l'] = this.waveformL;
    data['spectral_m'] = this.spectralM;
    data['spectral_l'] = this.spectralL;
    data['waveform_bw_m'] = this.waveformBwM;
    data['waveform_bw_l'] = this.waveformBwL;
    data['spectral_bw_m'] = this.spectralBwM;
    data['spectral_bw_l'] = this.spectralBwL;
    return data;
  }
}
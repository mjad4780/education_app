class Video {
  final int? id;
  final String? title;
  final String? url;
  final bool? isFreeApi;
  final bool? isVideo;
  final bool? watched;
  final int videoId;

  Video({
    required this.id,
    required this.title,
    required this.watched,
    required this.url,
    this.isFreeApi,
    required this.isVideo,
    required this.videoId,
  });

  factory Video.fromJson(Map<String, dynamic> json, bool? isFreeApi) {
    return Video(
      videoId: json['video_id'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      isVideo: json['is_video'],
      watched: json['watched'],
      isFreeApi: isFreeApi,
    );
  }
  bool get isFree {
    return isFreeApi == true
        ? true
        : videoId == 1
            ? true
            : false;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'isFree': isFree,
      'is_video': isVideo,
    };
  }
}

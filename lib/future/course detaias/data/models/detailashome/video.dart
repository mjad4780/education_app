class Video {
  final int? id;
  final String? title;
  final String? url;
  final bool? isFree;
  final bool? isVideo;
  final bool? watched;

  Video({
    required this.id,
    required this.title,
    required this.watched,
    required this.url,
    required this.isFree,
    required this.isVideo,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      isFree: json['is_free'],
      isVideo: json['is_video'],
      watched: json['watched'],
    );
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

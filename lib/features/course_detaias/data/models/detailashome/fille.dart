class Fille {
  final int? id;
  final String? title;
  final String? url;
  final bool? isFree;
  final bool? isVideo;

  Fille({
    required this.id,
    required this.title,
    required this.url,
    required this.isFree,
    required this.isVideo,
  });

  factory Fille.fromJson(Map<String, dynamic> json) {
    return Fille(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      isFree: json['is_free'],
      isVideo: json['is_video'],
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

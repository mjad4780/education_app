import 'package:collection/collection.dart';

class Video {
  int? id;
  String? title;
  String? duration;
  String? url;

  Video({this.id, this.title, this.duration, this.url});

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json['id'] as int?,
        title: json['title'] as String?,
        duration: json['duration'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'duration': duration,
        'url': url,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Video) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ duration.hashCode ^ url.hashCode;
}

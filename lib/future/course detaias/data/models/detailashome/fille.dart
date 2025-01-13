import 'package:collection/collection.dart';

class Fille {
  String? title;
  String? url;
  bool? downloaded;

  Fille({this.title, this.url, this.downloaded});

  factory Fille.fromJson(Map<String, dynamic> json) => Fille(
        title: json['title'] as String?,
        url: json['url'] as String?,
        downloaded: json['downloaded'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
        'downloaded': downloaded,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Fille) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => title.hashCode ^ url.hashCode ^ downloaded.hashCode;
}

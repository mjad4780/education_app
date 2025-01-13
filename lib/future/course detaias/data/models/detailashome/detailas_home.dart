import 'package:collection/collection.dart';

import 'fille.dart';
import 'video.dart';

class Detailashome {
  int? detailsId;
  String? description;
  String? duration;
  String? level;
  List<Video>? videos;
  List<Fille>? filles;

  Detailashome({
    this.detailsId,
    this.description,
    this.duration,
    this.level,
    this.videos,
    this.filles,
  });

  factory Detailashome.fromJson(Map<String, dynamic> json) => Detailashome(
        detailsId: json['details_id'] as int?,
        description: json['description'] as String?,
        duration: json['duration'] as String?,
        level: json['level'] as String?,
        videos: (json['videos'] as List<dynamic>?)
            ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
            .toList(),
        filles: (json['filles'] as List<dynamic>?)
            ?.map((e) => Fille.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'details_id': detailsId,
        'description': description,
        'duration': duration,
        'level': level,
        'videos': videos?.map((e) => e.toJson()).toList(),
        'filles': filles?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Detailashome) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      detailsId.hashCode ^
      description.hashCode ^
      duration.hashCode ^
      level.hashCode ^
      videos.hashCode ^
      filles.hashCode;
}

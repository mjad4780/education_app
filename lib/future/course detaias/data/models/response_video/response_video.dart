import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'lecture.dart';

part 'response_video.g.dart';

@JsonSerializable()
class ResponseVideo {
  List<Lecture>? lectures;

  ResponseVideo({this.lectures});

  factory ResponseVideo.fromJson(Map<String, dynamic> json) {
    return _$ResponseVideoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseVideoToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseVideo) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => lectures.hashCode;
}

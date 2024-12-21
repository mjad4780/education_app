import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'resource.dart';

part 'lecture.g.dart';

@JsonSerializable()
class Lecture {
  String? lectureTitle;
  String? lectureDuration;
  List<Resource>? resources;

  Lecture({this.lectureTitle, this.lectureDuration, this.resources});

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return _$LectureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LectureToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Lecture) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      lectureTitle.hashCode ^ lectureDuration.hashCode ^ resources.hashCode;
}

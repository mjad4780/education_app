// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lecture _$LectureFromJson(Map<String, dynamic> json) => Lecture(
      lectureTitle: json['lectureTitle'] as String?,
      lectureDuration: json['lectureDuration'] as String?,
      resources: (json['resources'] as List<dynamic>?)
          ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LectureToJson(Lecture instance) => <String, dynamic>{
      'lectureTitle': instance.lectureTitle,
      'lectureDuration': instance.lectureDuration,
      'resources': instance.resources,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseVideo _$ResponseVideoFromJson(Map<String, dynamic> json) =>
    ResponseVideo(
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => Lecture.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseVideoToJson(ResponseVideo instance) =>
    <String, dynamic>{
      'lectures': instance.lectures,
    };

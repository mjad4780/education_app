import 'lecture.dart';

class CourseModel {
  List<Lecture>? lectures;

  CourseModel({this.lectures});

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        lectures: (json['lectures'] as List<dynamic>?)
            ?.map((e) => Lecture.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'lectures': lectures?.map((e) => e.toJson()).toList(),
      };
}

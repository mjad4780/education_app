import 'dart:convert';

import 'package:collection/collection.dart';

import 'category.dart';
import 'course.dart';
import 'mentor.dart';

class ResponseHome {
  List<Category>? categories;
  List<Mentor>? mentors;
  List<Course>? courses;

  ResponseHome({this.categories, this.mentors, this.courses});

  factory ResponseHome.fromMap(Map<String, dynamic> data) => ResponseHome(
        categories: (data['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromMap(e as Map<String, dynamic>))
            .toList(),
        mentors: (data['mentors'] as List<dynamic>?)
            ?.map((e) => Mentor.fromMap(e as Map<String, dynamic>))
            .toList(),
        courses: (data['courses'] as List<dynamic>?)
            ?.map((e) => Course.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'categories': categories?.map((e) => e.toMap()).toList(),
        'mentors': mentors?.map((e) => e.toMap()).toList(),
        'courses': courses?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResponseHome].
  factory ResponseHome.fromJson(String data) {
    return ResponseHome.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResponseHome] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseHome) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }
}

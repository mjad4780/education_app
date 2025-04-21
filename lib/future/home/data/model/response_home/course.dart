import 'dart:convert';

import 'package:collection/collection.dart';

class Course {
  final int? id;

  final String? title;
  final String? categoryName;
  final int? mentorId;
  final double? price;
  final bool? isFree;
  final String? imageUrl;
  final int? duration;
  final String? level;
  final String? description;
  Course({
    this.level,
    this.description,
    this.duration,
    this.id,
    this.title,
    this.categoryName,
    this.mentorId,
    this.price,
    this.isFree,
    this.imageUrl,
  });

  factory Course.fromMap(Map<String, dynamic> data) => Course(
        id: data['id'],
        title: data['title'],
        categoryName: data['category_name'],
        mentorId: data['mentor_id'],
        price: data['price'].toDouble(),
        isFree: data['is_free'],
        imageUrl: data['image_url'],
        description: data['description'],
        duration: data['duration'],
        level: data['level'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'category_name': categoryName,
        'mentor_name': mentorId,
        'mentor_id': mentorId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Course].
  factory Course.fromJson(String data) {
    return Course.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Course] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Course) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }
}

class CourseModel {
  final int id;

  final String title;
  final int categoryId;
  final int mentorId;
  final double price;
  final bool isFree;
  final String imageUrl;
  final int duration;
  final String level;
  final String description;
  CourseModel({
    required this.level,
    required this.description,
    required this.duration,
    required this.id,
    required this.title,
    required this.categoryId,
    required this.mentorId,
    required this.price,
    required this.isFree,
    required this.imageUrl,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      categoryId: json['category_id'],
      mentorId: json['mentor_id'],
      price: json['price'].toDouble(),
      isFree: json['is_free'],
      imageUrl: json['image_url'],
      description: json['description'],
      duration: json['duration'],
      level: json['level'],
    );
  }
}

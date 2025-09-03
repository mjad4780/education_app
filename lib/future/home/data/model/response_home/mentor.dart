import 'dart:convert';

import 'package:collection/collection.dart';

class Mentor {
  int? id;
  String? name;
  String? bio;
  String? profileImage;
  String? title;
  int? countCourse;
  List<String>? followers;

  Mentor(
      {this.id,
      this.name,
      this.bio,
      this.countCourse,
      this.profileImage,
      this.title,
      this.followers});

  factory Mentor.fromMap(Map<String, dynamic> data) => Mentor(
        followers: (data['followers'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        id: data['id'] as int?,
        countCourse: data['count_course'] as int?,
        name: data['name'] as String?,
        bio: data['bio'] as String?,
        title: data['title'] as String?,
        profileImage: data['profile_image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'followers': followers,
        'id': id,
        'name': name,
        'bio': bio,
        'count_course': countCourse,
        'title': title,
        'profile_image': profileImage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Mentor].
  factory Mentor.fromJson(String data) {
    return Mentor.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Mentor] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Mentor) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ bio.hashCode ^ profileImage.hashCode;
}

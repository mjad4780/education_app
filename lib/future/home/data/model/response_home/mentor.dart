import 'dart:convert';

import 'package:collection/collection.dart';

class Mentor {
  int? id;
  String? name;
  String? bio;
  String? profileImage;
  String? title;

  Mentor({this.id, this.name, this.bio, this.profileImage, this.title});

  factory Mentor.fromMap(Map<String, dynamic> data) => Mentor(
        id: data['id'] as int?,
        name: data['name'] as String?,
        bio: data['bio'] as String?,
        title: data['title'] as String?,
        profileImage: data['profile_image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'bio': bio,
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

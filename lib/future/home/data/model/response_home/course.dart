import 'dart:convert';

import 'package:collection/collection.dart';

class Course {
  int? id;
  String? title;
  String? categoryName;
  int? mentorId;
  int? price;
  bool? paid;
  bool? save;
  String? image;

  Course({
    this.id,
    this.title,
    this.categoryName,
    this.mentorId,
    this.price,
    this.paid,
    this.save,
    this.image,
  });

  factory Course.fromMap(Map<String, dynamic> data) => Course(
        id: data['id'] as int?,
        title: data['title'] as String?,
        categoryName: data['category_name'] as String?,
        mentorId: data['mentor_id'] as int?,
        price: data['price'] as int?,
        paid: data['paid'] as bool?,
        save: data['save'] as bool?,
        image: data['image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'category_name': categoryName,
        'mentor_id': mentorId,
        'price': price,
        'paid': paid,
        'save': save,
        'image': image,
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

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      categoryName.hashCode ^
      mentorId.hashCode ^
      price.hashCode ^
      paid.hashCode ^
      save.hashCode ^
      image.hashCode;
}

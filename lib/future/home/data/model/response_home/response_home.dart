import 'dart:convert';

import 'package:collection/collection.dart';

import 'platform.dart';

class ResponseHome {
  Platform? platform;

  ResponseHome({this.platform});

  factory ResponseHome.fromMap(Map<String, dynamic> data) => ResponseHome(
        platform: data['platform'] == null
            ? null
            : Platform.fromMap(data['platform'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'platform': platform?.toMap(),
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

  @override
  int get hashCode => platform.hashCode;
}

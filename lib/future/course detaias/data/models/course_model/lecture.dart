class Lecture {
  String? lectureTitle;
  String? lectureDuration;
  List<String>? resources;

  Lecture({this.lectureTitle, this.lectureDuration, this.resources});

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
        lectureTitle: json['lectureTitle'] as String?,
        lectureDuration: json['lectureDuration'] as String?,
        resources: json['resources'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'lectureTitle': lectureTitle,
        'lectureDuration': lectureDuration,
        'resources': resources,
      };
}

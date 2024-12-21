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

class Lecture {
  String? lectureTitle;
  String? lectureDuration;
  List<Url>? resources;

  Lecture({this.lectureTitle, this.lectureDuration, this.resources});

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
        lectureTitle: json['lectureTitle'] as String?,
        lectureDuration: json['lectureDuration'] as String?,
        resources: json['resources'] as List<Url>?,
      );

  Map<String, dynamic> toJson() => {
        'lectureTitle': lectureTitle,
        'lectureDuration': lectureDuration,
        'resources': resources,
      };
}

class Url {
  String? url;
  String? name;

  Url({
    this.url,
    this.name,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        url: json['leurlctureTitle'] as String?,
        name: json['name'] as String?,
      );
}

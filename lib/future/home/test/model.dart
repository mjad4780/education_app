class Platform {
  final String name;
  final List<Category> categories;
  final List<Mentor> mentors;
  final List<Course> courses;

  Platform({
    required this.name,
    required this.categories,
    required this.mentors,
    required this.courses,
  });
}

class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});
}

class Mentor {
  final int id;
  final String name;
  final String bio;
  final String profileImage;

  Mentor({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImage,
  });
}

class Course {
  final int id;
  final String title;
  final int categoryId;
  final int mentorId;
  final CourseDetails details;

  Course({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.mentorId,
    required this.details,
  });
}

class CourseDetails {
  final String description;
  final String duration;
  final String level;
  final List<Video> videos;

  CourseDetails({
    required this.description,
    required this.duration,
    required this.level,
    required this.videos,
  });
}

class Video {
  final int id;
  final String title;
  final String duration;
  final String url;

  Video({
    required this.id,
    required this.title,
    required this.duration,
    required this.url,
  });
}

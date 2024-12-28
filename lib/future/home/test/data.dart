import 'model.dart';

void main() {
  final platform = Platform(
    name: "Learning Platform",
    categories: [
      Category(id: 1, name: "Programming"),
      Category(id: 2, name: "Design"),
      Category(id: 3, name: "Data Science"),
      Category(id: 4, name: "Marketing"),
      Category(id: 5, name: "Business"),
    ],
    mentors: [
      Mentor(
          id: 201,
          name: "John Doe",
          bio: "Expert Python developer with 10 years of experience",
          profileImage: "https://example.com/john_doe.jpg"),
      Mentor(
          id: 202,
          name: "Jane Smith",
          bio: "Professional UI/UX designer with 8 years of experience",
          profileImage: "https://example.com/jane_smith.jpg"),
      Mentor(
          id: 203,
          name: "Alan Turing",
          bio: "Data scientist specializing in machine learning",
          profileImage: "https://example.com/alan_turing.jpg"),
      Mentor(
          id: 204,
          name: "Sophia Brown",
          bio: "Marketing strategist with over 12 years in the field",
          profileImage: "https://example.com/sophia_brown.jpg"),
      Mentor(
          id: 205,
          name: "Michael Johnson",
          bio: "Entrepreneur and business consultant",
          profileImage: "https://example.com/michael_johnson.jpg"),
    ],
    courses: [
      Course(
        id: 101,
        title: "Introduction to Python",
        categoryId: 1,
        mentorId: 201,
        details: CourseDetails(
          description: "Learn the basics of Python programming from scratch.",
          duration: "5 hours",
          level: "Beginner",
          videos: [
            Video(
                id: 301,
                title: "What is Python?",
                duration: "10 minutes",
                url: "https://example.com/videos/python_intro.mp4"),
            Video(
                id: 302,
                title: "Setting up Python",
                duration: "15 minutes",
                url: "https://example.com/videos/setup_python.mp4"),
            Video(
                id: 303,
                title: "Python Basics",
                duration: "20 minutes",
                url: "https://example.com/videos/python_basics.mp4"),
          ],
        ),
      ),
      Course(
        id: 102,
        title: "UI/UX Basics",
        categoryId: 2,
        mentorId: 202,
        details: CourseDetails(
          description: "Learn the principles of UI and UX design.",
          duration: "4 hours",
          level: "Intermediate",
          videos: [
            Video(
                id: 304,
                title: "Introduction to UI/UX",
                duration: "12 minutes",
                url: "https://example.com/videos/uiux_intro.mp4"),
            Video(
                id: 305,
                title: "Wireframing Basics",
                duration: "20 minutes",
                url: "https://example.com/videos/wireframing_basics.mp4"),
            Video(
                id: 306,
                title: "Prototyping Tools",
                duration: "18 minutes",
                url: "https://example.com/videos/prototyping_tools.mp4"),
          ],
        ),
      ),
      Course(
        id: 103,
        title: "Data Science Fundamentals",
        categoryId: 3,
        mentorId: 203,
        details: CourseDetails(
          description: "Explore the key concepts of data science.",
          duration: "6 hours",
          level: "Beginner",
          videos: [
            Video(
                id: 307,
                title: "Introduction to Data Science",
                duration: "15 minutes",
                url: "https://example.com/videos/data_science_intro.mp4"),
            Video(
                id: 308,
                title: "Data Analysis Techniques",
                duration: "25 minutes",
                url: "https://example.com/videos/data_analysis.mp4"),
            Video(
                id: 309,
                title: "Visualization Basics",
                duration: "20 minutes",
                url: "https://example.com/videos/visualization_basics.mp4"),
          ],
        ),
      ),
      Course(
        id: 104,
        title: "Digital Marketing 101",
        categoryId: 4,
        mentorId: 204,
        details: CourseDetails(
          description: "Learn the fundamentals of digital marketing.",
          duration: "7 hours",
          level: "Beginner",
          videos: [
            Video(
                id: 310,
                title: "Marketing Strategies",
                duration: "30 minutes",
                url: "https://example.com/videos/marketing_strategies.mp4"),
            Video(
                id: 311,
                title: "SEO Basics",
                duration: "40 minutes",
                url: "https://example.com/videos/seo_basics.mp4"),
            Video(
                id: 312,
                title: "Social Media Marketing",
                duration: "35 minutes",
                url: "https://example.com/videos/social_media_marketing.mp4"),
          ],
        ),
      ),
      Course(
        id: 105,
        title: "Startup Essentials",
        categoryId: 5,
        mentorId: 205,
        details: CourseDetails(
          description: "Get started with building your own startup.",
          duration: "8 hours",
          level: "Advanced",
          videos: [
            Video(
                id: 313,
                title: "Business Planning",
                duration: "50 minutes",
                url: "https://example.com/videos/business_planning.mp4"),
            Video(
                id: 314,
                title: "Fundraising Basics",
                duration: "40 minutes",
                url: "https://example.com/videos/fundraising_basics.mp4"),
            Video(
                id: 315,
                title: "Pitching Your Idea",
                duration: "45 minutes",
                url: "https://example.com/videos/pitching.mp4"),
          ],
        ),
      ),
      Course(
        id: 106,
        title: "Java for Beginners",
        categoryId: 1,
        mentorId: 201,
        details: CourseDetails(
          description: "Learn the basics of Java programming.",
          duration: "6 hours",
          level: "Beginner",
          videos: [
            Video(
                id: 316,
                title: "Introduction to Java",
                duration: "15 minutes",
                url: "https://example.com/videos/java_intro.mp4"),
            Video(
                id: 317,
                title: "Setting up Java",
                duration: "10 minutes",
                url: "https://example.com/videos/java_setup.mp4"),
            Video(
                id: 318,
                title: "Java Basics",
                duration: "20 minutes",
                url: "https://example.com/videos/java_basics.mp4"),
          ],
        ),
      ),
      Course(
        id: 107,
        title: "Advanced Python",
        categoryId: 1,
        mentorId: 201,
        details: CourseDetails(
          description: "Master advanced Python programming concepts.",
          duration: "8 hours",
          level: "Advanced",
          videos: [
            Video(
                id: 319,
                title: "Advanced Functions",
                duration: "30 minutes",
                url: "https://example.com/videos/advanced_functions.mp4"),
            Video(
                id: 320,
                title: "Data Structures in Python",
                duration: "40 minutes",
                url: "https://example.com/videos/data_structures.mp4"),
            Video(
                id: 321,
                title: "Working with APIs",
                duration: "35 minutes",
                url: "https://example.com/videos/apis.mp4"),
          ],
        ),
      ),
      Course(
        id: 108,
        title: "Graphic Design Principles",
        categoryId: 2,
        mentorId: 202,
        details: CourseDetails(
          description: "Understand the principles of graphic design.",
          duration: "5 hours",
          level: "Intermediate",
          videos: [
            Video(
                id: 322,
                title: "Design Elements",
                duration: "25 minutes",
                url: "https://example.com/videos/design_elements.mp4"),
            Video(
                id: 323,
                title: "Typography Basics",
                duration: "20 minutes",
                url: "https://example.com/videos/typography.mp4"),
            Video(
                id: 324,
                title: "Color Theory",
                duration: "15 minutes",
                url: "https://example.com/videos/color_theory.mp4"),
          ],
        ),
      ),
      Course(
        id: 109,
        title: "Data Visualization Techniques",
        categoryId: 3,
        mentorId: 203,
        details: CourseDetails(
          description: "Learn techniques for effective data visualization.",
          duration: "7 hours",
          level: "Advanced",
          videos: [
            Video(
                id: 325,
                title: "Introduction to Visualization",
                duration: "20 minutes",
                url: "https://example.com/videos/visualization_intro.mp4"),
            Video(
                id: 326,
                title: "Creating Dashboards",
                duration: "30 minutes",
                url: "https://example.com/videos/dashboards.mp4"),
            Video(
                id: 327,
                title: "Interactive Visuals",
                duration: "25 minutes",
                url: "https://example.com/videos/interactive_visuals.mp4"),
          ],
        ),
      ),
      Course(
        id: 110,
        title: "Branding Strategies",
        categoryId: 4,
        mentorId: 204,
        details: CourseDetails(
          description: "Learn how to build and maintain a brand.",
          duration: "6 hours",
          level: "Intermediate",
          videos: [
            Video(
                id: 328,
                title: "What is Branding?",
                duration: "15 minutes",
                url: "https://example.com/videos/branding_intro.mp4"),
            Video(
                id: 329,
                title: "Building a Brand Identity",
                duration: "25 minutes",
                url: "https://example.com/videos/brand_identity.mp4"),
            Video(
                id: 330,
                title: "Brand Consistency",
                duration: "20 minutes",
                url: "https://example.com/videos/brand_consistency.mp4"),
          ],
        ),
      ),
    ],
  );

  print("Platform Name: ${platform.name}");
  print("Courses: ${platform.courses.map((c) => c.title).toList()}");
}

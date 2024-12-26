class ExamOverviewModel {
  Data? data;
  int? statusCode;
  Null meta;

  ExamOverviewModel({this.data, this.statusCode, this.meta});

  ExamOverviewModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    statusCode = json['status_code'];
    meta = json['meta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status_code'] = statusCode;
    data['meta'] = meta;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  int? price;
  int? isFree;
  String? description;
  String? image;
  int? examsCount;
  int? discountPrice;
  Enrollment? enrollment;
  List<ExamsOverview>? exams;
  int? wishlist;

  Data(
      {this.id,
      this.title,
      this.price,
      this.isFree,
      this.description,
      this.image,
      this.examsCount,
      this.discountPrice,
      this.enrollment,
      this.exams,
      this.wishlist});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    isFree = json['is_free'];
    description = json['description'];
    image = json['image'];
    examsCount = json['exams_count'];
    discountPrice = json['discount_price'];
    enrollment = json['enrollment'] != null
        ? Enrollment.fromJson(json['enrollment'])
        : null;
    if (json['exams'] != null) {
      exams = <ExamsOverview>[];
      json['exams'].forEach((v) {
        exams!.add(ExamsOverview.fromJson(v));
      });
    }
    wishlist = json['wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['is_free'] = isFree;
    data['description'] = description;
    data['image'] = image;
    data['exams_count'] = examsCount;
    data['discount_price'] = discountPrice;
    if (enrollment != null) {
      data['enrollment'] = enrollment!.toJson();
    }
    if (exams != null) {
      data['exams'] = exams!.map((v) => v.toJson()).toList();
    }
    data['wishlist'] = wishlist;
    return data;
  }
}

class Enrollment {
  int? isBought;
  String? expiredAt;
  String? boughtAt;
  int? canAccess;

  Enrollment({this.isBought, this.expiredAt, this.boughtAt, this.canAccess});

  Enrollment.fromJson(Map<String, dynamic> json) {
    isBought = json['is_bought'];
    expiredAt = json['expired_at'];
    boughtAt = json['bought_at'];
    canAccess = json['can_access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_bought'] = isBought;
    data['expired_at'] = expiredAt;
    data['bought_at'] = boughtAt;
    data['can_access'] = canAccess;
    return data;
  }
}

class ExamsOverview {
  int? id;
  String? title;
  String? description;
  Null image;
  int? examTime;
  String? examPackage;
  int? examPackageId;
  int? allowedAttempts;
  int? allowBack;
  String? startTime;
  int? minScore;
  int? showAnswer;
  int? desc;
  int? questionsCount;
  PausedAttempts? pausedAttempts;
  int? previousAttempts;
  List<Breaks>? breaks;
  bool? breakExists;

  ExamsOverview(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.examTime,
      this.examPackage,
      this.examPackageId,
      this.allowedAttempts,
      this.allowBack,
      this.startTime,
      this.minScore,
      this.showAnswer,
      this.desc,
      this.questionsCount,
      this.pausedAttempts,
      this.previousAttempts,
      this.breaks,
      this.breakExists});

  ExamsOverview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    examTime = json['exam_time'];
    examPackage = json['exam_package_widgets'];
    examPackageId = json['exam_package_id'];
    allowedAttempts = json['allowed_attempts'];
    allowBack = json['allow_back'];
    startTime = json['start_time'];
    minScore = json['min_score'];
    showAnswer = json['show_answer'];
    desc = json['desc'];
    questionsCount = json['questions_count'];
    pausedAttempts = json['paused_attempts'] != null
        ? PausedAttempts.fromJson(json['paused_attempts'])
        : null;
    previousAttempts = json['previous_attempts'];
    if (json['breaks'] != null) {
      breaks = <Breaks>[];
      json['breaks'].forEach((v) {
        breaks!.add(Breaks.fromJson(v));
      });
    }
    breakExists = json['breakExists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['exam_time'] = examTime;
    data['exam_package_widgets'] = examPackage;
    data['exam_package_id'] = examPackageId;
    data['allowed_attempts'] = allowedAttempts;
    data['allow_back'] = allowBack;
    data['start_time'] = startTime;
    data['min_score'] = minScore;
    data['show_answer'] = showAnswer;
    data['desc'] = desc;
    data['questions_count'] = questionsCount;
    if (pausedAttempts != null) {
      data['paused_attempts'] = pausedAttempts!.toJson();
    }
    data['previous_attempts'] = previousAttempts;
    if (breaks != null) {
      data['breaks'] = breaks!.map((v) => v.toJson()).toList();
    }
    data['breakExists'] = breakExists;
    return data;
  }
}

class PausedAttempts {
  int? attemptId;
  int? questionsCount;
  int? unansweredQuestions;
  String? remainingTime;
  int? lastOne;
  String? createdAt;
  int? attemptNumber;
  int? packageId;

  PausedAttempts(
      {this.attemptId,
      this.questionsCount,
      this.unansweredQuestions,
      this.remainingTime,
      this.lastOne,
      this.createdAt,
      this.attemptNumber,
      this.packageId});

  PausedAttempts.fromJson(Map<String, dynamic> json) {
    attemptId = json['attempt_id'];
    questionsCount = json['questions_count'];
    unansweredQuestions = json['unanswered_questions'];
    remainingTime = json['remaining_time'];
    lastOne = json['last_one'];
    createdAt = json['created_at'];
    attemptNumber = json['attempt_number'];
    packageId = json['package_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attempt_id'] = attemptId;
    data['questions_count'] = questionsCount;
    data['unanswered_questions'] = unansweredQuestions;
    data['remaining_time'] = remainingTime;
    data['last_one'] = lastOne;
    data['created_at'] = createdAt;
    data['attempt_number'] = attemptNumber;
    data['package_id'] = packageId;
    return data;
  }
}

class Breaks {
  int? time;
  int? question;
  String? message;

  Breaks({this.time, this.question, this.message});

  Breaks.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    question = json['question'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['question'] = question;
    data['message'] = message;
    return data;
  }
}

ExamOverviewModel examOverview = ExamOverviewModel(
  data: Data(
    id: 1,
    title: 'دورة 1',
    price: 100,
    isFree: 0, // دورة مدفوعة
    description: 'وصف الدورة رقم 1',
    image: 'https://example.com/image1.jpg',
    examsCount: 10,
    discountPrice: 50,
    enrollment: Enrollment(
      isBought: 1,
      expiredAt: '2025-12-01',
      boughtAt: '2024-12-25',
      canAccess: 1,
    ),
    exams: [
      ExamsOverview(
        id: 1,
        title: 'امتحان رقم 1',
        description: 'وصف الامتحان رقم 1',
        image: null,
        examTime: 60,
        examPackage: 'حزمة امتحانات 1',
        examPackageId: 1,
        allowedAttempts: 3,
        allowBack: 1,
        startTime: '2024-12-01T10:00:00',
        minScore: 60,
        showAnswer: 1,
        desc: 1,
        questionsCount: 20,
        pausedAttempts: PausedAttempts(
          attemptId: 1,
          questionsCount: 20,
          unansweredQuestions: 5,
          remainingTime: '10:00',
          lastOne: 0,
          createdAt: '2024-12-01T10:00:00',
          attemptNumber: 1,
          packageId: 1,
        ),
        previousAttempts: 0,
        breaks: [
          Breaks(
            time: 10,
            question: 1,
            message: 'استراحة بين السؤال 1',
          ),
          Breaks(
            time: 20,
            question: 2,
            message: 'استراحة بين السؤال 2',
          ),
        ],
        breakExists: true,
      ),
    ],
    wishlist: 10,
  ),
  statusCode: 200,
  meta: null,
);

// طباعة بعض البيانات للتأكد

// تعبئة بيانات وهمية
List<ExamOverviewModel> examOverviewList = [
  ExamOverviewModel(
    data: Data(
      id: 1,
      title: "Mathematics Basics",
      price: 100,
      isFree: 0,
      description: "A comprehensive course on basic mathematics.",
      image: "http://example.com/math.jpg",
      examsCount: 5,
      discountPrice: 80,
      enrollment: Enrollment(
        isBought: 1,
        expiredAt: "2024-12-31",
        boughtAt: "2024-01-01",
        canAccess: 1,
      ),
      exams: [
        ExamsOverview(
          id: 101,
          title: "Basic Algebra",
          description: "An exam covering basic algebra concepts.",
          image: null,
          examTime: 60,
          examPackage: "Algebra Package",
          examPackageId: 201,
          allowedAttempts: 3,
          allowBack: 1,
          startTime: "2024-01-15T10:00:00Z",
          minScore: 50,
          showAnswer: 1,
          desc: 0,
          questionsCount: 20,
          pausedAttempts: PausedAttempts(
            attemptId: 1,
            questionsCount: 20,
            unansweredQuestions: 5,
            remainingTime: "00:20:00",
            lastOne: 1,
            createdAt: "2024-01-15T10:05:00Z",
            attemptNumber: 2,
            packageId: 201,
          ),
          previousAttempts: 1,
          breaks: [
            Breaks(
              time: 10,
              question: 5,
              message: "Take a short break.",
            ),
          ],
          breakExists: true,
        ),
      ],
      wishlist: 1,
    ),
    statusCode: 200,
    meta: null,
  ),
];

// عرض البيانات

// تعبئة بيانات وهمية

// عرض البيانات

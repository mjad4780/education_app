class ExamReport {
  Data? data;
  int? statusCode;
  Null meta;

  ExamReport({this.data, this.statusCode, this.meta});

  ExamReport.fromJson(Map<String, dynamic> json) {
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
  int? score;
  int? success;
  String? message;
  int? minScore;
  String? startDate;
  String? endDate;
  int? totalTime;
  int? correctAnswersCount;
  List<Questions>? questions;
  String? title;
  Data({
    this.id,
    this.score,
    this.success,
    this.message,
    this.minScore,
    this.startDate,
    this.endDate,
    this.totalTime,
    this.correctAnswersCount,
    this.questions,
    this.title,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    score = json['score'];
    success = json['success'];
    message = json['message'];
    minScore = json['min_score'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    totalTime = json['total_time'];
    correctAnswersCount = json['correct_answers_count'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['score'] = score;

    data['success'] = success;
    data['message'] = message;
    data['min_score'] = minScore;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['total_time'] = totalTime;
    data['correct_answers_count'] = correctAnswersCount;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? id;
  String? title;
  List<Options>? options;
  List<Answers>? answers;
  int? multiple;
  Questions({
    this.id,
    this.title,
    this.answers,
    this.options,
    this.multiple,
  });

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    multiple = json['multiple'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['multiple'] = multiple;
    return data;
  }
}

class Options {
  String? key;
  String? title;
  String? titleAr;
  int? isCorrect;
  int? isSelected;
  Null attachment;

  Options(
      {this.key,
      this.title,
      this.titleAr,
      this.isCorrect,
      this.isSelected,
      this.attachment});

  Options.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    titleAr = json['title_ar'];
    isCorrect = json['is_correct'];
    isSelected = json['is_selected'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['title'] = title;
    data['title_ar'] = titleAr;
    data['is_correct'] = isCorrect;
    data['is_selected'] = isSelected;
    data['attachment'] = attachment;
    return data;
  }
}

class Answers {
  int? index;
  String? key;
  String? answer;
  String? answerAr;

  Answers({this.index, this.key, this.answer, this.answerAr});

  Answers.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    key = json['key'];
    answer = json['answer'];
    answerAr = json['answer_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['key'] = key;
    data['answer'] = answer;
    data['answer_ar'] = answerAr;
    return data;
  }
}

ExamReport examReports = ExamReport(
  data: Data(
    id: 1,
    score: 80,
    success: 1,
    message: "Exam completed successfully.",
    minScore: 50,
    startDate: "2024-12-25T10:00:00",
    endDate: "2024-12-25T11:00:00",
    totalTime: 60,
    correctAnswersCount: 4,
    questions: [
      Questions(
        id: 1,
        title: "What is the capital of France?",
        options: [
          Options(
              key: "A",
              title: "Paris",
              titleAr: "باريس",
              isCorrect: 1,
              isSelected: 1,
              attachment: null),
          Options(
              key: "B",
              title: "Berlin",
              titleAr: "برلين",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
          Options(
              key: "C",
              title: "Madrid",
              titleAr: "مدريد",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
          Options(
              key: "D",
              title: "Rome",
              titleAr: "روما",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
        ],
        answers: [
          Answers(index: 0, key: "A", answer: "Paris", answerAr: "باريس"),
        ],
        multiple: 0,
      ),
      Questions(
        id: 2,
        title: "What is 2 + 2?",
        options: [
          Options(
              key: "A",
              title: "3",
              titleAr: "3",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
          Options(
              key: "B",
              title: "4",
              titleAr: "4",
              isCorrect: 1,
              isSelected: 0,
              attachment: null),
          Options(
              key: "C",
              title: "5",
              titleAr: "5",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
          Options(
              key: "D",
              title: "6",
              titleAr: "6",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
        ],
        answers: [
          Answers(index: 1, key: "B", answer: "4", answerAr: "4"),
        ],
        multiple: 0,
      ),
      Questions(
        id: 3,
        title: "Which planet is known as the Red Planet?",
        options: [
          Options(
              key: "A",
              title: "Mars",
              titleAr: "المريخ",
              isCorrect: 1,
              isSelected: 0,
              attachment: null),
          Options(
              key: "B",
              title: "Venus",
              titleAr: "الزهرة",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
          Options(
              key: "C",
              title: "Earth",
              titleAr: "الأرض",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
          Options(
              key: "D",
              title: "Jupiter",
              titleAr: "المشتري",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
        ],
        answers: [
          Answers(index: 0, key: "A", answer: "Mars", answerAr: "المريخ"),
        ],
        multiple: 0,
      ),
      Questions(
        id: 4,
        title: "What is the largest ocean on Earth?",
        options: [
          Options(
              key: "A",
              title: "Atlantic Ocean",
              titleAr: "المحيط الأطلسي",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
          Options(
              key: "B",
              title: "Indian Ocean",
              titleAr: "المحيط الهندي",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
          Options(
              key: "C",
              title: "Pacific Ocean",
              titleAr: "المحيط الهادئ",
              isCorrect: 1,
              isSelected: 0,
              attachment: null),
          Options(
              key: "D",
              title: "Arctic Ocean",
              titleAr: "المحيط القطبي الشمالي",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
        ],
        answers: [
          Answers(
              index: 2,
              key: "C",
              answer: "Pacific Ocean",
              answerAr: "المحيط الهادئ"),
        ],
        multiple: 0,
      ),
      Questions(
        id: 5,
        title: "Who wrote 'Romeo and Juliet'?",
        options: [
          Options(
              key: "A",
              title: "Shakespeare",
              titleAr: "شكسبير",
              isCorrect: 1,
              isSelected: 1,
              attachment: null),
          Options(
              key: "B",
              title: "Dickens",
              titleAr: "ديكنز",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
          Options(
              key: "C",
              title: "Hemingway",
              titleAr: "همينغواي",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
          Options(
              key: "D",
              title: "Austen",
              titleAr: "أوستن",
              isCorrect: 0,
              isSelected: 0,
              attachment: null),
        ],
        answers: [
          Answers(
              index: 0, key: "A", answer: "Shakespeare", answerAr: "شكسبير"),
        ],
        multiple: 0,
      ),
    ],
    title: "Sample Exam",
  ),
  statusCode: 200,
  meta: null,
);

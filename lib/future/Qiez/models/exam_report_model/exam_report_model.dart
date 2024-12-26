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

List<ExamReport> examReportsList = List.generate(10, (index) {
  return ExamReport(
    data: Data(
      id: index + 1,
      score: 80,
      success: 1,
      message: 'تم اجتياز الامتحان بنجاح',
      minScore: 50,
      startDate: '2024-12-01',
      endDate: '2024-12-10',
      totalTime: 120,
      correctAnswersCount: 8,
      questions: List.generate(5, (i) {
        return Questions(
          id: i + 1,
          title: 'سؤال رقم ${i + 1}',
          multiple: 1,
          options: List.generate(4, (j) {
            return Options(
              key: 'option$j',
              title: 'اختيار $j',
              titleAr: 'Option $j',
              isCorrect: j == 0 ? 1 : 0, // الخيار الأول صحيح
              isSelected: 0,
              attachment: null,
            );
          }),
          answers: List.generate(1, (k) {
            return Answers(
              index: 0,
              key: 'option0',
              answer: 'الإجابة الصحيحة هي الاختيار 0',
              answerAr: 'The correct answer is option 0',
            );
          }),
        );
      }),
      title: 'تقرير الامتحان رقم ${index + 1}',
    ),
    statusCode: 200,
    meta: null,
  );
});

// طباعة بعض البيانات للتأكد

// تعبئة بيانات وهمية
List<ExamReport> examReports = [
  ExamReport(
    data: Data(
      id: 1,
      title: "Math Exam Report",
      score: 85,
      success: 1,
      message: "You passed the exam successfully.",
      minScore: 50,
      startDate: "2024-12-01T10:00:00Z",
      endDate: "2024-12-01T11:30:00Z",
      totalTime: 90,
      correctAnswersCount: 17,
      questions: [
        Questions(
          id: 101,
          title: "What is 2 + 2?",
          multiple: 0,
          options: [
            Options(
              key: "A",
              title: "3",
              titleAr: "٣",
              isCorrect: 0,
              isSelected: 1,
              attachment: null,
            ),
            Options(
              key: "B",
              title: "4",
              titleAr: "٤",
              isCorrect: 1,
              isSelected: 0,
              attachment: null,
            ),
            Options(
              key: "c",
              title: "6",
              titleAr: "٤",
              isCorrect: 0,
              isSelected: 0,
              attachment: null,
            ),
            Options(
              key: "d",
              title: "6",
              titleAr: "٤",
              isCorrect: 0,
              isSelected: 0,
              attachment: null,
            ),
          ],
          answers: [
            Answers(
              index: 0,
              key: "B",
              answer: "4",
              answerAr: "٤",
            ),
          ],
        ),
        Questions(
          id: 102,
          title: "What is 5 * 3?",
          multiple: 0,
          options: [
            Options(
              key: "A",
              title: "15",
              titleAr: "١٥",
              isCorrect: 1,
              isSelected: 1,
              attachment: null,
            ),
            Options(
              key: "B",
              title: "10",
              titleAr: "١٠",
              isCorrect: 0,
              isSelected: 0,
              attachment: null,
            ),
          ],
          answers: [
            Answers(
              index: 0,
              key: "A",
              answer: "15",
              answerAr: "١٥",
            ),
          ],
        ),
      ],
    ),
    statusCode: 200,
    meta: null,
  ),
];

// عرض البيانات

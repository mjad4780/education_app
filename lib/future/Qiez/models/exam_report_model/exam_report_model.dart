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
    data['title'] = this.title;
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
        options!.add(new Options.fromJson(v));
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
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['multiple'] = this.multiple;
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

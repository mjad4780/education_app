//model

class ExamQuestionModel {
  List<DataQuestions>? data;
  int? statusCode;
  Null meta;

  ExamQuestionModel({this.data, this.statusCode, this.meta});

  ExamQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataQuestions>[];
      json['data'].forEach((v) {
        data!.add(DataQuestions.fromJson(v));
      });
    }
    statusCode = json['status_code'];
    meta = json['meta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    data['meta'] = meta;
    return data;
  }
}

class DataQuestions {
  int? id;
  String? title;
  String? titleAr;
  String? type;
  Illistraton? illistraton;
  Attachment? attachment;
  int? multiple;
  List<Options>? options;
  Null answeredCorrect;
  Null isFlagged;
  Null studentAnswer;
  List<Answers>? answers;

  DataQuestions(
      {this.id,
      this.title,
      this.titleAr,
      this.type,
      this.illistraton,
      this.attachment,
      this.multiple,
      this.options,
      this.answeredCorrect,
      this.isFlagged,
      this.studentAnswer,
      this.answers});

  DataQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleAr = json['title_ar'];
    type = json['type'];
    illistraton = json['illistraton'] != null
        ? Illistraton.fromJson(json['illistraton'])
        : null;
    attachment = json['attachment'] != null
        ? Attachment.fromJson(json['attachment'])
        : null;
    multiple = json['multiple'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    answeredCorrect = json['answered_correct'];
    isFlagged = json['is_flagged'];
    studentAnswer = json['student_answer'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['title_ar'] = titleAr;
    data['type'] = type;
    if (illistraton != null) {
      data['illistraton'] = illistraton!.toJson();
    }
    if (attachment != null) {
      data['attachment'] = attachment!.toJson();
    }
    data['multiple'] = multiple;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['answered_correct'] = answeredCorrect;
    data['is_flagged'] = isFlagged;
    data['student_answer'] = studentAnswer;
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Illistraton {
  String? text;

  Illistraton({this.text});

  Illistraton.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    return data;
  }
}

class Attachment {
  String? type;
  String? url;

  Attachment({this.type, this.url});

  Attachment.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['url'] = url;
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

ExamQuestionModel examQuestionModel = ExamQuestionModel(
  data: [
    DataQuestions(
      id: 1,
      title: "What is the capital of France?",
      titleAr: "ما هي عاصمة فرنسا؟",
      type: "single_choice",
      illistraton: Illistraton(text: "A map of France."),
      attachment:
          Attachment(type: "image", url: "https://example.com/question1.jpg"),
      multiple: 0,
      options: [
        Options(
            key: "A",
            title: "Paris",
            titleAr: "باريس",
            isCorrect: 1,
            isSelected: 0,
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
      answeredCorrect: null,
      isFlagged: null,
      studentAnswer: null,
      answers: [
        Answers(index: 0, key: "A", answer: "Paris", answerAr: "باريس"),
      ],
    ),
    DataQuestions(
      id: 2,
      title: "What is 2 + 2?",
      titleAr: "ما هو 2 + 2؟",
      type: "single_choice",
      illistraton: Illistraton(text: "A simple math question."),
      attachment: null,
      multiple: 0,
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
      answeredCorrect: null,
      isFlagged: null,
      studentAnswer: null,
      answers: [
        Answers(index: 1, key: "B", answer: "4", answerAr: "4"),
      ],
    ),
    DataQuestions(
      id: 3,
      title: "Which planet is known as the Red Planet?",
      titleAr: "أي كوكب يُعرف بالكوكب الأحمر؟",
      type: "single_choice",
      illistraton: Illistraton(text: "A picture of Mars."),
      attachment:
          Attachment(type: "image", url: "https://example.com/question3.jpg"),
      multiple: 0,
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
      answeredCorrect: null,
      isFlagged: null,
      studentAnswer: null,
      answers: [
        Answers(index: 0, key: "A", answer: "Mars", answerAr: "المريخ"),
      ],
    ),
    DataQuestions(
      id: 4,
      title: "What is the largest ocean on Earth?",
      titleAr: "ما هو أكبر محيط على الأرض؟",
      type: "single_choice",
      illistraton: Illistraton(text: "An image of the world's oceans."),
      attachment:
          Attachment(type: "image", url: "https://example.com/question4.jpg"),
      multiple: 0,
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
      answeredCorrect: null,
      isFlagged: null,
      studentAnswer: null,
      answers: [
        Answers(
            index: 2,
            key: "C",
            answer: "Pacific Ocean",
            answerAr: "المحيط الهادئ"),
      ],
    ),
    DataQuestions(
      id: 5,
      title: "Who wrote 'Romeo and Juliet'?",
      titleAr: "من كتب 'روميو وجولييت'؟",
      type: "single_choice",
      illistraton: Illistraton(text: "A picture of Shakespeare."),
      attachment:
          Attachment(type: "image", url: "https://example.com/question5.jpg"),
      multiple: 0,
      options: [
        Options(
            key: "A",
            title: "Shakespeare",
            titleAr: "شكسبير",
            isCorrect: 1,
            isSelected: 0,
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
      answeredCorrect: null,
      isFlagged: null,
      studentAnswer: null,
      answers: [
        Answers(index: 0, key: "A", answer: "Shakespeare", answerAr: "شكسبير"),
      ],
    ),
    // Add 5 more questions similarly...
  ],
  statusCode: 200,
  meta: null,
);

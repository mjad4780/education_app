import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../models/exam_overview_model/examOverViewModel.dart';
import '../models/exam_questions_model/exam_questions_model.dart';
import '../models/exam_report_model/exam_report_model.dart';

part 'exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  ExamCubit(this.controller) : super(ExamInitial());
  final CountdownController controller;

  ExamOverviewModel? examOverviewData = examOverview;

  int score = 0;

  ExamQuestionModel examquestionsData = examQuestionModel;

  int currentIndex = 0;

  void updateCurrentIndex(int index) {
    currentIndex = index;
    emit(ExamReportCurrentIndexChangedState(currentIndex));
  }

  // Maintain a map to store selected options for each question
  Map<int, String> selectedOptions = {};
  String? selectedOption;
  // Method to update the selected option for a specific question
  void updateOption(int questionIndex, String option) {
    selectedOption = option;
    selectedOptions[questionIndex] = option;
    emit(ExamQuestionOptionSelected(questionIndex));
  }

  int correctAnswersCount = 0;
  List<Questions> answersData = [];
  List<Questions> returnAnswersData(List<Questions> questionsData) {
    for (var i = 0; i < questionsData.length; i++) {
      for (var j = 0; j < questionsData[i].options!.length; j++) {
        if (questionsData[i].options![j].key! == selectedOptions[i + 1]) {
          questionsData[i].options![j].isSelected = 1;
          if (questionsData[i].options![j].isSelected == 1 &&
              questionsData[i].options![j].isCorrect == 1) {
            score += 20;
            correctAnswersCount += 1;
          }
        } else {
          questionsData[i].options![j].isSelected = 0;
        }
      }
    }

    return answersData = questionsData;
  }

  String? selectedOptionForQuestion(int questionIndex) {
    return selectedOptions[questionIndex];
  }

  void updateMultiOption(int questionIndex, String option) {
    if (selectedOptions.containsKey(questionIndex)) {
      var selectedOption = selectedOptions[questionIndex];
      if (selectedOption!.contains(option)) {
        selectedOption = selectedOption.replaceAll(option, '');
        selectedOption = selectedOption.replaceAll(RegExp(r'^,+|,+?$'), '');
        if (selectedOption.isEmpty) {
          selectedOptions.remove(questionIndex);
        } else {
          selectedOptions[questionIndex] = selectedOption;
        }
      } else {
        selectedOptions[questionIndex] = '$selectedOption,$option';
      }
    } else {
      selectedOptions[questionIndex] = option;
    }
    emit(ExamQuestionOptionSelected(questionIndex));
    // print(selectedOptions);
  }

  // Method to get the selected options for a specific question
  String? selectedOptionsForQuestion(int questionIndex) {
    return selectedOptions[questionIndex];
  }

  void submitStudentAnswers(
    String examId,
    Map<int, String> studentAnswers,
  ) {
    emit(ExamSubmitLoading());

    Map<String, dynamic> formattedStudentAnswers = {};
    studentAnswers.forEach((key, value) {
      formattedStudentAnswers[key.toString()] = value;
    });
  }
}

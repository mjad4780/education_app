//cubit
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/exam_overview_model/examOverViewModel.dart';
import '../../models/exam_questions_model/exam_questions_model.dart';
import 'states.dart';

class ExamsCubit extends Cubit<ExamQuestionStats> {
  ExamsCubit() : super(ExamQuestionsInitialStats());

  bool showimage = true;

  static ExamsCubit get(context) => BlocProvider.of(context);

  ExamQuestionModel? examquestionsData;

  void getExamQuestions({int? id}) {
    emit(ExamQuestionsLoading());
    // DioHelper.getData(
    //     url: 'examQuestions',
    //     token: 'Bearer 14|fHJ371jakReEo5G8in6j4nFLFfTImCeDQ3Prqj6Z',
    //     query: {
    //       'exam_id': id,
    //     }).then((value) {
    //   emit(ExamQuestionsSuccess());
    //   examquestionsData = ExamQuestionModel.fromJson(value.data);
    //   allExams = examquestionsData?.data ?? [];
    //   print("data:${examquestionsData?.data?[0].type}");
    // }).catchError((error) {
    //   emit(ExamQuestionsError());
    //   print(error);
    // });
  }

  void IsVisible() {
    showimage = !showimage;
    emit(ShowImageSuccess());
  }

  ExamOverviewModel? examOverviewData;

  void getExamOverview() {
    emit(ExamOverviewLoading());
    // DioHelper.getData(
    //     url: 'exam-packages-details',
    //     token: 'Bearer 27|M0EG1UVmRXcem731Ze2YJfTSz11wAzvO9M4kqOd9',
    //     query: {
    //       'id': '8',
    //       'lang': 'en',
    //     }).then((value) {
    //   emit(ExamOverviewSuccess());
    //   examOverviewData = ExamOverviewModel.fromJson(value.data);
    //   print(examOverviewData?.data);
    // }).catchError((error) {
    //   emit(ExamOverviewError());
    //   print(error);
    // });
  }

  int currentIndex = 0;

  void updateCurrentIndex(int index) {
    currentIndex = index;
    emit(ExamReportCurrentIndexChangedState(currentIndex));
  }

  // Maintain a map to store selected options for each question
  Map<int, String> selectedOptions = {};

  // Method to update the selected option for a specific question
  void updateOption(int questionIndex, String option) {
    selectedOptions[questionIndex] = option;
    emit(ExamQuestionOptionSelected(questionIndex));
    print(selectedOptions);
  }

  // Method to get the selected option for a specific question
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
    print(selectedOptions);
  }

  // Method to get the selected options for a specific question
  String? selectedOptionsForQuestion(int questionIndex) {
    return selectedOptions[questionIndex];
  }

  void submitStudentAnswers(String examId, Map<int, String> studentAnswers,
      Function(Map<String, dynamic>) onPostSuccess) {
    emit(ExamSubmitLoading());

    Map<String, dynamic> formattedStudentAnswers = {};
    studentAnswers.forEach((key, value) {
      formattedStudentAnswers[key.toString()] = value;
    });

    // Map<String, dynamic> data = {
    //   'exam_id': examId,
    //   'student_answers': formattedStudentAnswers,
    //   'start_date': '2022-02-01 14:08:24',
    //   'end_date': '2022-02-01 15:08:24',
    // };

    // DioHelper.postData(
    //   url: 'submitExam',
    //   data: data,
    //   token: 'Bearer 211|PBTo9S7Yh3hwffX1dqAVFLIV2wqrRFLGNoxYOdtW',
    // ).then((response) {
    //   // Handle success
    //   emit(ExamSubmitSuccess());
    //   print('Exam submitted successfully');
    //   onPostSuccess(
    //       response.data); // Pass the response data to the callback function
    // }).catchError((error) {
    //   // Handle error
    //   emit(ExamSubmitError(error.toString()));
    //   print('Error submitting exam: $error');
    // });
  }

  List<DataQuestions>? allExams = [];

  void filterExamPackages(String query) {
    emit(ExamQuestionsLoading());
    if (query.isEmpty) {
      examquestionsData = ExamQuestionModel(data: allExams);
      emit(ExamQuestionsSuccess());
      return;
    } else {
      List<DataQuestions> filteredExams = allExams!
          .where(
              (exam) => exam.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      examquestionsData = ExamQuestionModel(data: filteredExams);
      emit(ExamQuestionsSuccess());
    }
  }
}

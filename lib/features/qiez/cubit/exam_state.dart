part of 'exam_cubit.dart';

sealed class ExamState {}

final class ExamInitial extends ExamState {}

class ExamQuestionsInitialStats extends ExamState {}

class ExamQuestionsLoading extends ExamState {}

class ExamQuestionsSuccess extends ExamState {}

class ExamQuestionsError extends ExamState {}

class ShowImageSuccess extends ExamState {}

class ExamOverviewLoading extends ExamState {}

class ExamOverviewSuccess extends ExamState {}

class ExamOverviewError extends ExamState {}

class ExamQuestionOptionSelected extends ExamState {
  final int index;

  ExamQuestionOptionSelected(this.index);
}

class ExamReportCurrentIndexChangedState extends ExamState {
  final int currentIndex;

  ExamReportCurrentIndexChangedState(this.currentIndex);
}

class AnswerValue extends ExamState {}

class ExamSubmitLoading extends ExamState {}

class ExamSubmitSuccess extends ExamState {}

class ExamSubmitError extends ExamState {
  final String error;
  ExamSubmitError(this.error);
}

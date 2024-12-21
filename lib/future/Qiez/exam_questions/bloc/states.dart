abstract class ExamQuestionStats {}

class ExamQuestionsInitialStats extends ExamQuestionStats {}

class ExamQuestionsLoading extends ExamQuestionStats {}

class ExamQuestionsSuccess extends ExamQuestionStats {}

class ExamQuestionsError extends ExamQuestionStats {}

class ShowImageSuccess extends ExamQuestionStats {}

class ExamOverviewLoading extends ExamQuestionStats {}

class ExamOverviewSuccess extends ExamQuestionStats {}

class ExamOverviewError extends ExamQuestionStats {}

class ExamQuestionOptionSelected extends ExamQuestionStats {
  final int index;

  ExamQuestionOptionSelected(this.index);
}

class ExamReportCurrentIndexChangedState extends ExamQuestionStats {
  final int currentIndex;

  ExamReportCurrentIndexChangedState(this.currentIndex);
}

class AnswerValue extends ExamQuestionStats {}

class ExamSubmitLoading extends ExamQuestionStats {}

class ExamSubmitSuccess extends ExamQuestionStats {}

class ExamSubmitError extends ExamQuestionStats {
  final String error;
  ExamSubmitError(this.error);
}

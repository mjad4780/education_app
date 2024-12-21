abstract class ExamReportStates {}

class ExamReportInitialState extends ExamReportStates {}

class ExamReportLoadingState extends ExamReportStates {}

class ExamReportSuccessState extends ExamReportStates {}

class ExamReportErrorState extends ExamReportStates {
  final String error;

  ExamReportErrorState(this.error);
}

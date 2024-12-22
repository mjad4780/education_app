//cubit
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/exam_report_model/exam_report_model.dart';
import 'state.dart';

class ExamReportCubit extends Cubit<ExamReportStates> {
  ExamReportCubit() : super(ExamReportInitialState());

  static ExamReportCubit get(context) => BlocProvider.of(context);

  ExamReport? examReport = examReports.first;

  void getExamReport({Map<String, dynamic>? responseData}) {
    emit(ExamReportLoadingState());
    //  String studentExamId = responseData?['data'].toString() ?? '';
    // DioHelper.getData(
    //     url: 'examReport',
    //     token: 'Bearer 90|qwLnRQamnY38ahfLjxY5juRZonfQaDX5kL3uj9ep',
    //     query: {
    //       'student_exam_id': studentExamId,
    //     }).then((value) {
    //   emit(ExamReportSuccessState());
    //   examReport = ExamReport.fromJson(value.data);
    // }).catchError((error) {
    //   emit(ExamReportErrorState(error.toString()));
    // });
  }
}

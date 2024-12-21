import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/exam_overview_model/examOverViewModel.dart';
import 'states.dart';

class ExamsCubit extends Cubit<ExamsOverviewStats> {
  ExamsCubit() : super(ExamsOverviewInitialStats());

  static ExamsCubit get(context) => BlocProvider.of(context);

  ExamOverviewModel? examOverviewData;

  void getExamOverview({int? id}) {
    emit(ExamOverviewLoading());
    // DioHelper.getData(
    //     url: 'exam-packages-details',
    //     token: 'Bearer 27|M0EG1UVmRXcem731Ze2YJfTSz11wAzvO9M4kqOd9',
    //     query: {
    //       'id': id,
    //       'lang': 'en',
    //     }).then((value) {
    //   emit(ExamOverviewSuccess());
    //   examOverviewData = ExamOverviewModel.fromJson(value.data);
    //   // print(examOverviewData?.data);
    // }).catchError((error) {
    //   emit(ExamOverviewError());
    //   // print(error);
    // });
  }
}

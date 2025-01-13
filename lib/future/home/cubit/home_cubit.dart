import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../json.dart';
import '../data/model/response_home/response_home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentindex = 0;

  updatecurrentendex(int index) {
    emit(UpdateCurrentIndex(currentindex = index));
  }

  int currentindexpupalr = 0;

  updatecurrentendexbuplar(int index) {
    emit(UpdateCurrentIndexPoluapr(currentindexpupalr = index));
  }

  ResponseHome? responseHome;
  getData() {
    responseHome = ResponseHome.fromMap(responsehome);
    emit(EmitgetDataHome(responseHome!));
  }
}

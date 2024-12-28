import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
}

import 'package:bloc/bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  void changeIndex(int index) {
    emit(MainIndex(index));
  }
}

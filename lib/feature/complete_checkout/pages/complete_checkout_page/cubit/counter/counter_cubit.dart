import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(1);
  void increment() => emit(state + 1);
  void decrement() {
    if (state == 1) {
      return;
    }
    emit(state - 1);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

class TotalCubit extends Cubit<double> {
  TotalCubit(final double initialTotal) : super(initialTotal);

  int _productCount = 0;

  void addProduct({final double? price}) {
    emit(state + (price ?? 0));
    _productCount++;
  }

  void removeProduct({final double? price}) {
    if (_productCount > 0) {
      emit(state - (price ?? 0));
      _productCount--;
    }
  }
}

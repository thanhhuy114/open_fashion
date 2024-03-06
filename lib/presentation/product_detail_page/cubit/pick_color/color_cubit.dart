import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<int> {
  ColorCubit() : super(0);
  void onTap({int? selectedIndex}) {
    emit(selectedIndex!);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

class SizeCubit extends Cubit<int> {
  SizeCubit() : super(0);
  void onTap({int? selectedIndex}) {
    emit(selectedIndex!);
  }
}

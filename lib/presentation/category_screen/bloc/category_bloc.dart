import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:open_fashion/network/api.dart';
import 'package:open_fashion/presentation/category_screen/model/category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryLoadEvent>(_onCategoryLoadEvent);
  }

  Future<FutureOr<void>> _onCategoryLoadEvent(
      CategoryLoadEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    List<Cat>? data = await Api.getCategoryResponse();
    emit(CategoryLoaded(lstCat: data!));
  }
}

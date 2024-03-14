import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import '../../../network/api.dart';

import '../../../models/category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryLoadEvent>(_onCategoryLoadEvent);
  }

  Future<FutureOr<void>> _onCategoryLoadEvent(
    final CategoryLoadEvent event,
    final Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final List<Cat>? data = await Api.getCategoryResponse();
    emit(CategoryLoaded(lstCat: data!));
  }
}

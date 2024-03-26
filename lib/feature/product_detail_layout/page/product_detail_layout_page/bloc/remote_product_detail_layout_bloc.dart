import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../ultis/resources/data_state.dart';
import '../../../domain/entities/product_detail_layout.dart';
import '../../../domain/usecases/get_product_detail_layout.dart';

part 'remote_product_detail_layout_event.dart';
part 'remote_product_detail_layout_state.dart';

class RemoteProductDetailLayoutBloc extends Bloc<RemoteProductDetailLayoutEvent,
    RemoteProductDetailLayoutState> {
  RemoteProductDetailLayoutBloc(this._getProductDetailLayoutUsecase)
      : super(const RemoteProductDetailLayoutLoading()) {
    on<RemoteProductDetailLayoutEvent>(onGetProductDetailLayout);
  }
  final GetProductDetailLayoutUsecase _getProductDetailLayoutUsecase;

  FutureOr<void> onGetProductDetailLayout(
    final RemoteProductDetailLayoutEvent event,
    final Emitter<RemoteProductDetailLayoutState> emit,
  ) async {
    emit(const RemoteProductDetailLayoutLoading());
    try {
      final dataState = await _getProductDetailLayoutUsecase();
      if (dataState is DataSuccess ) {
        emit(RemoteProductDetailLayoutDone(dataState.data!.data!));
      }
      if (dataState is DataFailed) {
        emit(const RemoteProductDetailLayoutLoading());
      }
    } catch (e) {
      emit(const RemoteProductDetailLayoutError());
    }
  }
}

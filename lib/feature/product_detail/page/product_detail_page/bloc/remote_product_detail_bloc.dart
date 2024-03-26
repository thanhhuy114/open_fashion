import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../ultis/resources/data_state.dart';
import '../../../domain/entities/product_detail_response.dart';
import '../../../domain/usecases/get_product_detail.dart';

part 'remote_product_detail_event.dart';
part 'remote_product_detail_state.dart';

class RemoteProductDetailBloc
    extends Bloc<RemoteProductDetailEvent, RemoteProductDetailState> {
  RemoteProductDetailBloc(this._getProductDetailUseCase)
      : super(const RemoteProductDetailLoading()) {
    on<GetProductDetailEvent>(onGetProductDetail);
  }
  final GetProductDetailUseCase _getProductDetailUseCase;

  FutureOr<void> onGetProductDetail(
    final GetProductDetailEvent event,
    final Emitter<RemoteProductDetailState> emit,
  ) async {
    emit(const RemoteProductDetailLoading());
    try {
      final dataState = await _getProductDetailUseCase();
      if (dataState is DataSuccess) {
        emit(RemoteProductDetailDone(dataState.data!.data!));
      }
      if (dataState is DataFailed) {
        emit(RemoteProductDetailError());
      }
    } catch (e) {
      emit(RemoteProductDetailError());
    }
  }
}

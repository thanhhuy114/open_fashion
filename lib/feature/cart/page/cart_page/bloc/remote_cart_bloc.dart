import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../ultis/resources/data_state.dart';
import '../../../domain/entities/cart.dart';
import '../../../domain/usecases/get_cart.dart';

part 'remote_cart_event.dart';
part 'remote_cart_state.dart';

class RemoteCartBloc extends Bloc<RemoteCartEvent, RemoteCartState> {
  RemoteCartBloc(this._getCartUsecase) : super(const RemoteCartLoading()) {
    on<GetRemoteCartEvent>(onGetCart);
  }
  final GetCartUsecase _getCartUsecase;

  FutureOr<void> onGetCart(
    final GetRemoteCartEvent event,
    final Emitter<RemoteCartState> emit,
  ) async {
    emit(const RemoteCartLoading());
    try {
      final dataState = await _getCartUsecase();
      if (dataState is DataSuccess) {
        emit(RemoteCartDone(dataState.data!.data!));
      }
      if (dataState is DataFailed) {
        emit(RemoteCartDone(dataState.data!.data!));
      }
    } catch (e) {
      emit(const RemoteCartError());
    }
  }
}

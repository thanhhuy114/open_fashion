import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../ultis/resources/data_state.dart';
import '../../../domain/entities/complete_checkout.dart';
import '../../../domain/usecases/get_complete_checkout.dart';

part 'remote_complete_checkout_event.dart';
part 'remote_complete_checkout_state.dart';

class RemoteCompleteCheckoutBloc
    extends Bloc<RemoteCompleteCheckoutEvent, RemoteCompleteCheckoutState> {
  RemoteCompleteCheckoutBloc(this._getCompleteCheckoutUsecase)
      : super(const RemoteCompleteCheckoutLoading()) {
    on<RemoteCompleteCheckoutEvent>(onGetCompleteCheckout);
  }
  final GetCompleteCheckoutUsecase _getCompleteCheckoutUsecase;

  FutureOr<void> onGetCompleteCheckout(
    final RemoteCompleteCheckoutEvent event,
    final Emitter<RemoteCompleteCheckoutState> emit,
  ) async {
    emit(const RemoteCompleteCheckoutLoading());
    try {
      final dataState = await _getCompleteCheckoutUsecase();
      if (dataState is DataSuccess) {
        emit(RemoteCompleteCheckoutDone(dataState.data!.data!.checkout));
      }
      if (dataState is DataFailed) {
        emit(const RemoteCompleteCheckoutLoading());
      }
    } catch (e) {
      emit(const RemoteCompleteCheckoutError());
    }
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/checkout_response_model.dart';
import '../../../network/api.dart';

part 'complete_checkout_event.dart';
part 'complete_checkout_state.dart';

class CompleteCheckoutBloc
    extends Bloc<CompleteCheckoutEvent, CompleteCheckoutState> {
  CompleteCheckoutBloc() : super(const CompleteCheckoutLoading()) {
    on<CompleteCheckoutLoadedEvent>(_onCompleteCheckoutLoaded);
  }
  FutureOr<void> _onCompleteCheckoutLoaded(
    final CompleteCheckoutLoadedEvent event,
    final Emitter<CompleteCheckoutState> emit,
  ) async {
    emit(const CompleteCheckoutLoading());
    try {
      final checkoutData = await Api.getCheckout();
      if (checkoutData.data != null) {
        emit(CompleteCheckoutLoaded(checkoutModel: checkoutData.data!));
      } else {
        log('data null');
      }
    } catch (e) {
      emit(CompleteCheckoutError(errorMessage: e.toString()));
    }
  }
}

import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/cart_response_model.dart';
import '../../../network/api.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoadingState()) {
    on<CartLoadedEvent>(_onCartLoaded);
  }

  FutureOr<void> _onCartLoaded(
    final CartLoadedEvent event,
    final Emitter<CartState> emit,
  ) async {
    emit(CartLoadingState());
    try {
      final cartData = await Api.getCart();
      if (cartData.data != null) {
        emit(CartLoadedState(cartModel: cartData.data!));
      } else {
        log('data null');
      }
    } catch (e) {
      emit(CartErrorState(errorMessage: e.toString()));
    }
  }
}

import 'dart:async';
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
      emit(CartLoadedState(cartModel: cartData.data));
    } catch (e) {
      emit(CartErrorState(errorMessage: e.toString()));
    }
  }
}

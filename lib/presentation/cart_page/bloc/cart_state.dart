part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartLoadingState extends CartState {}

final class CartLoadedState extends CartState {
  const CartLoadedState({required this.cartModel});
  final CartModel cartModel;
  @override
  List<Object> get props => [cartModel];
}

final class CartErrorState extends CartState {
  const CartErrorState({this.errorMessage});
  final String? errorMessage;
  @override
  List<Object> get props => [errorMessage!];
}

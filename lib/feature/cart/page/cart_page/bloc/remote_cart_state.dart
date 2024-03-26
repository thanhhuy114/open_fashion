part of 'remote_cart_bloc.dart';

sealed class RemoteCartState extends Equatable {
  const RemoteCartState({this.cart});
  final CartEntity? cart;
  @override
  List<Object> get props => [cart!];
}

final class RemoteCartLoading extends RemoteCartState {
  const RemoteCartLoading();
}

final class RemoteCartDone extends RemoteCartState {
  const RemoteCartDone(final CartEntity cart) : super(cart: cart);
}

final class RemoteCartError extends RemoteCartState {
  const RemoteCartError();
}

part of 'remote_cart_bloc.dart';

sealed class RemoteCartEvent extends Equatable {
  const RemoteCartEvent();

  @override
  List<Object> get props => [];
}

class GetRemoteCartEvent extends RemoteCartEvent {
  const GetRemoteCartEvent();
}

part of 'remote_complete_checkout_bloc.dart';

sealed class RemoteCompleteCheckoutEvent extends Equatable {
  const RemoteCompleteCheckoutEvent();

  @override
  List<Object> get props => [];
}

class GetRemoteCompleteCheckout extends RemoteCompleteCheckoutEvent {
  const GetRemoteCompleteCheckout();
}

part of 'remote_complete_checkout_bloc.dart';

sealed class RemoteCompleteCheckoutState extends Equatable {
  const RemoteCompleteCheckoutState({this.completeCheckoutInfo});
  final CompleteCheckoutInfoEntity? completeCheckoutInfo;
  @override
  List<Object> get props => [completeCheckoutInfo!];
}

final class RemoteCompleteCheckoutLoading extends RemoteCompleteCheckoutState {
  const RemoteCompleteCheckoutLoading();
}

final class RemoteCompleteCheckoutDone extends RemoteCompleteCheckoutState {
  const RemoteCompleteCheckoutDone(
    final CompleteCheckoutInfoEntity checkoutInfoEntity,
  ) : super(completeCheckoutInfo: checkoutInfoEntity);
}

final class RemoteCompleteCheckoutError extends RemoteCompleteCheckoutState {
  const RemoteCompleteCheckoutError();
}

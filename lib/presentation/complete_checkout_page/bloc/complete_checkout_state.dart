part of 'complete_checkout_bloc.dart';

sealed class CompleteCheckoutState extends Equatable {
  const CompleteCheckoutState();

  @override
  List<Object> get props => [];
}

final class CompleteCheckoutInitial extends CompleteCheckoutState {}

final class CompleteCheckoutLoading extends CompleteCheckoutState {
  const CompleteCheckoutLoading();
}

final class CompleteCheckoutLoaded extends CompleteCheckoutState {
  const CompleteCheckoutLoaded({required this.checkoutModel});
  final CompleteCheckoutModel checkoutModel;
  @override
  List<Object> get props => [checkoutModel];
}

final class CompleteCheckoutError extends CompleteCheckoutState {
  const CompleteCheckoutError({this.errorMessage});
  final String? errorMessage;
  @override
  List<Object> get props => [errorMessage!];
}

part of 'complete_checkout_bloc.dart';

sealed class CompleteCheckoutEvent extends Equatable {
  const CompleteCheckoutEvent();

  @override
  List<Object> get props => [];
}

class CompleteCheckoutLoadedEvent extends CompleteCheckoutEvent {}

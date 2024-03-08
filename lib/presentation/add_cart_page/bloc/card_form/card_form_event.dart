part of 'card_form_bloc.dart';

abstract class CardFormEvent extends Equatable {
  const CardFormEvent();

  @override
  List<Object> props() => [];
}

class CheckNameOnCardTextField extends CardFormEvent {
  const CheckNameOnCardTextField({required this.text});

  final String text;
}

class CheckCardNumberTextField extends CardFormEvent {
  const CheckCardNumberTextField({required this.text});
  final String text;
}

class CheckExpMonthTextField extends CardFormEvent {
  const CheckExpMonthTextField({required this.text});
  final String text;
}

class CheckExpDateTextField extends CardFormEvent {
  const CheckExpDateTextField({required this.text});
  final String text;
}

class CheckCVVTextField extends CardFormEvent {
  const CheckCVVTextField({required this.text});
  final String text;
}

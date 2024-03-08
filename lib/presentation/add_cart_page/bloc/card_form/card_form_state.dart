part of 'card_form_bloc.dart';

class CardFormState extends Equatable {
  const CardFormState({
    this.isValidNameOnCard = true,
    this.isValidCardNumber = true,
    this.isValidExpMonth = true,
    this.isValidExpDate = true,
    this.isValidCvv = true,
    this.nameOnCardMessage = '',
    this.cardNumberMessage = '',
    this.expMonthMessage = '',
    this.expDateMessage = '',
    this.cvvMessage = '',
  });

  final bool isValidNameOnCard;
  final bool isValidCardNumber;
  final bool isValidExpMonth;
  final bool isValidExpDate;
  final bool isValidCvv;
  final String nameOnCardMessage;
  final String cardNumberMessage;
  final String expMonthMessage;
  final String expDateMessage;
  final String cvvMessage;

  CardFormState copyWith({
    final bool? isValidNameOnCard,
    final bool? isValidCardNumber,
    final bool? isValidExpMonth,
    final bool? isValidExpDate,
    final bool? isValidCvv,
    final String? nameOnCardMessage,
    final String? cardNumberMessage,
    final String? expMonthMessage,
    final String? expDateMessage,
    final String? cvvMessage,
  }) {
    return CardFormState(
      isValidNameOnCard: isValidNameOnCard ?? this.isValidNameOnCard,
      isValidCardNumber: isValidCardNumber ?? this.isValidCardNumber,
      isValidExpMonth: isValidExpMonth ?? this.isValidExpMonth,
      isValidExpDate: isValidExpDate ?? this.isValidExpDate,
      isValidCvv: isValidCvv ?? this.isValidCvv,
      nameOnCardMessage: nameOnCardMessage ?? this.nameOnCardMessage,
      cardNumberMessage: cardNumberMessage ?? this.cardNumberMessage,
      expMonthMessage: expMonthMessage ?? this.expMonthMessage,
      expDateMessage: expDateMessage ?? this.expDateMessage,
      cvvMessage: cvvMessage ?? this.cvvMessage,
    );
  }

  @override
  List<Object> props() => [
        isValidNameOnCard,
        isValidCardNumber,
        isValidExpMonth,
        isValidExpDate,
        isValidCvv,
        nameOnCardMessage,
        cardNumberMessage,
        expMonthMessage,
        expDateMessage,
        cvvMessage
      ];
}

class CardFormInitial extends CardFormState {}

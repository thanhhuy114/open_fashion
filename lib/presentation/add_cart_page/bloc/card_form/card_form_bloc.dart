import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../add_address_page/bloc/add_address_form/add_address_bloc.dart';

part 'card_form_event.dart';
part 'card_form_state.dart';

RegExp regexMonth = RegExp(r'^([1-9]|1[0-2])$');
RegExp regexDate = RegExp(r'^\d{4}$');
RegExp regexCvv = RegExp(r'^\d$');

class CardFormBloc extends Bloc<CardFormEvent, CardFormState> {
  CardFormBloc() : super(CardFormInitial()) {
    on<CheckNameOnCardTextField>(checkValidNameOnCard);
    on<CheckCardNumberTextField>(checkValidCardNumber);
    on<CheckExpMonthTextField>(checkValidExpMonth);
    on<CheckExpDateTextField>(checkValidExpDate);
    on<CheckCVVTextField>(checkValidCVV);
  }

  void checkValidNameOnCard(
    final CheckNameOnCardTextField event,
    final Emitter<CardFormState> emit,
  ) {
    //Ten tren card khong dc de trong
    //Khong duoc phep chua so hoac ki tu
    if (event.text.isEmpty) {
      emit(
        state.copyWith(
          isValidNameOnCard: false,
          nameOnCardMessage: '*Please fill your name on card.',
        ),
      );
    } else if (regexOnlyLetter.hasMatch(event.text.trim())) {
      emit(
        state.copyWith(
          isValidNameOnCard: false,
          nameOnCardMessage: '*Special characters or numbers are not allowed.',
        ),
      );
    } else {
      emit(
        state.copyWith(
          isValidNameOnCard: true,
          nameOnCardMessage:
              '*Please enter your exactly as it appears on your card',
        ),
      );
    }
  }

  void checkValidCardNumber(
    final CheckCardNumberTextField event,
    final Emitter<CardFormState> emit,
  ) {
    //Card number khong duoc de trong
    //Card number khong duoc chua chu cai hoac ky tu
    if (event.text.isEmpty) {
      //
      emit(
        state.copyWith(
          isValidCardNumber: false,
          cardNumberMessage: '*Please fill your card number',
        ),
      );
    } else if (!regexOnlyNumber.hasMatch(event.text.trim())) {
      //
      emit(
        state.copyWith(
          isValidCardNumber: false,
          cardNumberMessage: '*Special characters or latter are not allowed.',
        ),
      );
    } else {
      //
      emit(
        state.copyWith(
          isValidCardNumber: true,
          cardNumberMessage: '',
        ),
      );
    }
  }

  void checkValidExpMonth(
    final CheckExpMonthTextField event,
    final Emitter<CardFormState> emit,
  ) {
    //
    if (event.text.isEmpty) {
      //
      emit(
        state.copyWith(
          isValidExpMonth: false,
          expMonthMessage: '*Please fill card exp',
        ),
      );
    } else if (!regexMonth.hasMatch(event.text.trim())) {
      //
      emit(
        state.copyWith(
          isValidExpMonth: false,
          expMonthMessage: '*Valid',
        ),
      );
    } else {
      //
      emit(
        state.copyWith(
          isValidExpMonth: true,
          expMonthMessage: '',
        ),
      );
    }
  }

  void checkValidExpDate(
    final CheckExpDateTextField event,
    final Emitter<CardFormState> emit,
  ) {
    //date khong dc de trong
    //date la so
    //date lon hon date hien tai
    if (event.text.isEmpty) {
      emit(
        state.copyWith(
          isValidExpDate: false,
          expDateMessage: '*Please fill this.',
        ),
      );
    } else if (!regexDate.hasMatch(event.text.trim())) {
      emit(
        state.copyWith(
          isValidExpDate: false,
          expDateMessage: '*Not Right',
        ),
      );
    } else {
      if (int.parse(event.text) < DateTime.now().year) {
        emit(
          state.copyWith(
            isValidExpDate: false,
            expDateMessage: '*<',
          ),
        );
      } else {
        emit(
          state.copyWith(
            isValidExpDate: true,
            expDateMessage: '',
          ),
        );
      }
    }
  }

  void checkValidCVV(
    final CheckCVVTextField event,
    final Emitter<CardFormState> emit,
  ) {
    //
    if (event.text.isEmpty) {
      emit(
        state.copyWith(
          isValidCvv: false,
          cvvMessage: '*Please fill this.',
        ),
      );
    } else if (!regexCvv.hasMatch(event.text.trim())) {
      emit(
        state.copyWith(
          isValidCvv: false,
          cvvMessage: '*The special or letter are not allowed',
        ),
      );
    } else {
      emit(
        state.copyWith(
          isValidCvv: true,
          cvvMessage: '',
        ),
      );
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';

RegExp regexOnlyLetter = RegExp(r'^[a-zA-Z]* $');

RegExp regexOnlyNumber = RegExp(r'^[0-9]+$');
RegExp vietnamPhoneRegex = RegExp(
  r'^(?:\+?84|0)(?:\d{9}|(?:\d{2}-\d{3}-\d{4})|(?:\d{3}-\d{3}-\d{3}))$',
);
RegExp usZipCodeRegex = RegExp(r'^\d{5}(?:-\d{4})?$');

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc() : super(AddAddressInitial()) {
    on<AddNewAddress>(addNewAddress);
    on<CheckFirstNameTextField>(checkFirstNameTextField);
    on<CheckLastNameTextField>(checkLastNameTextField);
    on<CheckAddressTextField>(checkAddressTextField);
    on<CheckCityTextField>(checkCityTextField);
    on<CheckStateTextField>(checkStateTextField);
    on<CheckZipCodeTextField>(checkZipCodeTextField);
    on<CheckPhoneTextField>(checkPhoneTextField);
  }

  void addNewAddress(
    final AddNewAddress add,
    final Emitter<AddAddressState> emit,
  ) {}

  void checkFirstNameTextField(
    final CheckFirstNameTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(
        state.copyWith(
          firstNameTextField: true,
          firstNameMessage: '* Please fill your first name.',
        ),
      );
    } else if (!regexOnlyLetter.hasMatch(event.text.trim())) {
      emit(
        state.copyWith(
          firstNameTextField: true,
          firstNameMessage: '* Special characters or numbers are not allowed.',
        ),
      );
    } else {
      emit(
        state.copyWith(
          firstNameTextField: false,
          firstNameMessage: 'Valid',
        ),
      );
    }
  }

  void checkLastNameTextField(
    final CheckLastNameTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(
        state.copyWith(
          lastNameTextField: true,
          lastNameMessage: '* Please fill your last name.',
        ),
      );
    } else if (!regexOnlyLetter.hasMatch(event.text.trim())) {
      emit(state.copyWith(
        lastNameTextField: true,
        lastNameMessage: '* Special characters or numbers are not allowed.',
      ));
    } else {
      emit(
        state.copyWith(
          lastNameTextField: false,
          lastNameMessage: 'Valid',
        ),
      );
    }
  }

  void checkAddressTextField(
    final CheckAddressTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(
        state.copyWith(
          addressTextField: true,
          addressMessage: '* Please fill your address.',
        ),
      );
    } else {
      emit(
        state.copyWith(
          addressTextField: false,
          addressMessage: 'Valid',
        ),
      );
    }
  }

  void checkCityTextField(
    final CheckCityTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(
        state.copyWith(
          cityTextField: true,
          cityMessage: '* Please fill your city.',
        ),
      );
    } else {
      emit(
        state.copyWith(cityTextField: false, cityMessage: 'Valid'),
      );
    }
  }

  void checkStateTextField(
    final CheckStateTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(
        state.copyWith(
          stateTextField: true,
          stateMessage: '* Please fill state.',
        ),
      );
    } else {
      emit(
        state.copyWith(
          stateTextField: false,
          stateMessage: 'Valid',
        ),
      );
    }
  }

  void checkZipCodeTextField(
    final CheckZipCodeTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(
        state.copyWith(
          zipCodeTextField: true,
          zipCodeMessage: '* Please fill zip code.',
        ),
      );
    } else if (!usZipCodeRegex.hasMatch(event.text.trim())) {
      emit(
        state.copyWith(
          zipCodeTextField: true,
          zipCodeMessage: '* Wrong zip code format.',
        ),
      );
    } else {
      emit(
        state.copyWith(
          zipCodeTextField: false,
          zipCodeMessage: 'Valid',
        ),
      );
    }
  }

  void checkPhoneTextField(
    final CheckPhoneTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(
        state.copyWith(
          phoneNumberTextField: true,
          phoneNumberMessage: '* Please fill your phone number.',
        ),
      );
    } else if (!vietnamPhoneRegex.hasMatch(event.text.trim())) {
      emit(
        state.copyWith(
          phoneNumberTextField: true,
          phoneNumberMessage: '* Wrong phone number format.',
        ),
      );
    } else {
      emit(
        state.copyWith(
          phoneNumberTextField: false,
          phoneNumberMessage: 'Valid',
        ),
      );
    }
  }
}

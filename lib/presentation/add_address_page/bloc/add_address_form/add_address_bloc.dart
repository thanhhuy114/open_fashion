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
          isValidFirstName: true,
          firstNameMessage: '* Please fill your first name.',
        ),
      );
    } else if (!regexOnlyLetter.hasMatch(event.text.trim())) {
      emit(
        state.copyWith(
          isValidFirstName: true,
          firstNameMessage: '* Special characters or numbers are not allowed.',
        ),
      );
    } else {
      emit(
        state.copyWith(
          isValidFirstName: false,
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
          isValidLastName: true,
          lastNameMessage: '* Please fill your last name.',
        ),
      );
    } else if (!regexOnlyLetter.hasMatch(event.text.trim())) {
      emit(state.copyWith(
        isValidLastName: true,
        lastNameMessage: '* Special characters or numbers are not allowed.',
      ));
    } else {
      emit(
        state.copyWith(
          isValidLastName: false,
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
          isValidAddress: true,
          addressMessage: '* Please fill your address.',
        ),
      );
    } else {
      emit(
        state.copyWith(
          isValidAddress: false,
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
          isValidCity: true,
          cityMessage: '* Please fill your city.',
        ),
      );
    } else {
      emit(
        state.copyWith(isValidCity: false, cityMessage: 'Valid'),
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
          isValidState: true,
          stateMessage: '* Please fill state.',
        ),
      );
    } else {
      emit(
        state.copyWith(
          isValidState: false,
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
          isValidZipCode: true,
          zipCodeMessage: '* Please fill zip code.',
        ),
      );
    } else if (!usZipCodeRegex.hasMatch(event.text.trim())) {
      emit(
        state.copyWith(
          isValidZipCode: true,
          zipCodeMessage: '* Wrong zip code format.',
        ),
      );
    } else {
      emit(
        state.copyWith(
          isValidZipCode: false,
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
          isValidPhoneNumber: true,
          phoneNumberMessage: '* Please fill your phone number.',
        ),
      );
    } else if (!vietnamPhoneRegex.hasMatch(event.text.trim())) {
      emit(
        state.copyWith(
          isValidPhoneNumber: true,
          phoneNumberMessage: '* Wrong phone number format.',
        ),
      );
    } else {
      emit(
        state.copyWith(
          isValidPhoneNumber: false,
          phoneNumberMessage: 'Valid',
        ),
      );
    }
  }
}

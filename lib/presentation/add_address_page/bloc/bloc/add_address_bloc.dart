import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';

RegExp regexOnlyLetter = RegExp(r'^[a-zA-Z]*$');

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
      emit(state.copyWith(firstNameTextField: true));
    } else if (!regexOnlyLetter.hasMatch(event.text.trim())) {
      emit(state.copyWith(firstNameTextField: true));
    } else {
      emit(state.copyWith(firstNameTextField: false));
    }
  }

  void checkLastNameTextField(
    final CheckLastNameTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(state.copyWith(lastNameTextField: true));
    } else if (!regexOnlyLetter.hasMatch(event.text.trim())) {
      emit(state.copyWith(lastNameTextField: true));
    } else {
      emit(state.copyWith(lastNameTextField: false));
    }
  }

  void checkAddressTextField(
    final CheckAddressTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(state.copyWith(addressTextField: true));
    } else {
      emit(state.copyWith(addressTextField: false));
    }
  }

  void checkCityTextField(
    final CheckCityTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(state.copyWith(cityTextField: true));
    } else {
      emit(state.copyWith(cityTextField: false));
    }
  }

  void checkStateTextField(
    final CheckStateTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(state.copyWith(stateTextField: true));
    } else {
      emit(state.copyWith(stateTextField: false));
    }
  }

  void checkZipCodeTextField(
    final CheckZipCodeTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(state.copyWith(zipCodeTextField: true));
    } else if (!usZipCodeRegex.hasMatch(event.text.trim())) {
      emit(state.copyWith(zipCodeTextField: true));
    } else {
      emit(state.copyWith(zipCodeTextField: false));
    }
  }

  void checkPhoneTextField(
    final CheckPhoneTextField event,
    final Emitter<AddAddressState> emit,
  ) {
    if (event.text.trim().isEmpty) {
      emit(state.copyWith(phoneNumberTextField: true));
    } else if (!vietnamPhoneRegex.hasMatch(event.text.trim())) {
      emit(state.copyWith(phoneNumberTextField: true));
    } else {
      emit(state.copyWith(phoneNumberTextField: false));
    }
  }
}

part of 'add_address_bloc.dart';

class AddAddressState extends Equatable {
  const AddAddressState({
    this.firstNameTextField = false,
    this.lastNameTextField = false,
    this.addressTextField = false,
    this.cityTextField = false,
    this.stateTextField = false,
    this.zipCodeTextField = false,
    this.phoneNumberTextField = false,
  });
  final bool firstNameTextField;
  final bool lastNameTextField;
  final bool addressTextField;
  final bool cityTextField;
  final bool stateTextField;
  final bool zipCodeTextField;
  final bool phoneNumberTextField;

  AddAddressState copyWith({
    final bool? firstNameTextField,
    final bool? lastNameTextField,
    final bool? addressTextField,
    final bool? cityTextField,
    final bool? stateTextField,
    final bool? zipCodeTextField,
    final bool? phoneNumberTextField,
  }) {
    return AddAddressState(
      firstNameTextField: firstNameTextField ?? this.firstNameTextField,
      addressTextField: addressTextField ?? this.addressTextField,
      cityTextField: cityTextField ?? this.cityTextField,
      lastNameTextField: lastNameTextField ?? this.lastNameTextField,
      phoneNumberTextField: phoneNumberTextField ?? this.phoneNumberTextField,
      stateTextField: stateTextField ?? this.stateTextField,
      zipCodeTextField: zipCodeTextField ?? this.zipCodeTextField,
    );
  }

  @override
  List<Object> get props => [
        firstNameTextField,
        lastNameTextField,
        addressTextField,
        cityTextField,
        stateTextField,
        zipCodeTextField,
        phoneNumberTextField,
      ];
}

class AddAddressInitial extends AddAddressState {}

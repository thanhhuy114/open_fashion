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
    this.firstNameMessage = '',
    this.lastNameMessage = '',
    this.addressMessage = '',
    this.cityMessage = '',
    this.stateMessage = '',
    this.zipCodeMessage = '',
    this.phoneNumberMessage = '',
  });
  final bool firstNameTextField;
  final bool lastNameTextField;
  final bool addressTextField;
  final bool cityTextField;
  final bool stateTextField;
  final bool zipCodeTextField;
  final bool phoneNumberTextField;
  final String firstNameMessage;
  final String lastNameMessage;
  final String addressMessage;
  final String cityMessage;
  final String stateMessage;
  final String zipCodeMessage;
  final String phoneNumberMessage;

  AddAddressState copyWith({
    final bool? firstNameTextField,
    final bool? lastNameTextField,
    final bool? addressTextField,
    final bool? cityTextField,
    final bool? stateTextField,
    final bool? zipCodeTextField,
    final bool? phoneNumberTextField,
    final String? firstNameMessage,
    final String? lastNameMessage,
    final String? addressMessage,
    final String? cityMessage,
    final String? stateMessage,
    final String? zipCodeMessage,
    final String? phoneNumberMessage,
  }) {
    return AddAddressState(
      firstNameTextField: firstNameTextField ?? this.firstNameTextField,
      addressTextField: addressTextField ?? this.addressTextField,
      cityTextField: cityTextField ?? this.cityTextField,
      lastNameTextField: lastNameTextField ?? this.lastNameTextField,
      phoneNumberTextField: phoneNumberTextField ?? this.phoneNumberTextField,
      stateTextField: stateTextField ?? this.stateTextField,
      zipCodeTextField: zipCodeTextField ?? this.zipCodeTextField,
      firstNameMessage: firstNameMessage ?? this.firstNameMessage,
      lastNameMessage: lastNameMessage ?? this.lastNameMessage,
      addressMessage: addressMessage ?? this.addressMessage,
      cityMessage: cityMessage ?? this.cityMessage,
      stateMessage: stateMessage ?? this.stateMessage,
      zipCodeMessage: zipCodeMessage ?? this.zipCodeMessage,
      phoneNumberMessage: phoneNumberMessage ?? this.phoneNumberMessage,
    );
  }

  @override
  List<Object> props() => [
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

part of 'add_address_bloc.dart';

/*
Modifier By Thach
Date: 8/3 10:23
Content:
  - Change firstNameTextfield -> isValidFirstName
  - Change lastNameTextfield -> isValidLasName
  - Change addressTextfield -> isValidAddress
  - Change cityTextfield -> isValidCity
  - Change stateTextfield -> isValidState
  - Change zipCodeTextfield -> isValidZipCode
  - Change phoneNumberTextfield -> isValidPhoneNumber

 */
class AddAddressState extends Equatable {
  const AddAddressState({
    this.isValidFirstName = false,
    this.isValidLastName = false,
    this.isValidAddress = false,
    this.isValidCity = false,
    this.isValidState = false,
    this.isValidZipCode = false,
    this.isValidPhoneNumber = false,
    this.firstNameMessage = '',
    this.lastNameMessage = '',
    this.addressMessage = '',
    this.cityMessage = '',
    this.stateMessage = '',
    this.zipCodeMessage = '',
    this.phoneNumberMessage = '',
  });
  final bool isValidFirstName;
  final bool isValidLastName;
  final bool isValidAddress;
  final bool isValidCity;
  final bool isValidState;
  final bool isValidZipCode;
  final bool isValidPhoneNumber;
  final String firstNameMessage;
  final String lastNameMessage;
  final String addressMessage;
  final String cityMessage;
  final String stateMessage;
  final String zipCodeMessage;
  final String phoneNumberMessage;

  AddAddressState copyWith({
    final bool? isValidFirstName,
    final bool? isValidLastName,
    final bool? isValidAddress,
    final bool? isValidCity,
    final bool? isValidState,
    final bool? isValidZipCode,
    final bool? isValidPhoneNumber,
    final String? firstNameMessage,
    final String? lastNameMessage,
    final String? addressMessage,
    final String? cityMessage,
    final String? stateMessage,
    final String? zipCodeMessage,
    final String? phoneNumberMessage,
  }) {
    return AddAddressState(
      isValidFirstName: isValidFirstName ?? this.isValidFirstName,
      isValidLastName: isValidLastName ?? this.isValidLastName,
      isValidAddress: isValidAddress ?? this.isValidAddress,
      isValidCity: isValidCity ?? this.isValidCity,
      isValidPhoneNumber: isValidPhoneNumber ?? this.isValidPhoneNumber,
      isValidState: isValidState ?? this.isValidState,
      isValidZipCode: isValidZipCode ?? this.isValidZipCode,
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
  List<Object> get props => [
        isValidFirstName,
        isValidLastName,
        isValidAddress,
        isValidCity,
        isValidState,
        isValidZipCode,
        isValidPhoneNumber,
      ];
}

class AddAddressInitial extends AddAddressState {}

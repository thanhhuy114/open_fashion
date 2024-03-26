part of 'add_address_bloc.dart';

abstract class AddAddressEvent {
  const AddAddressEvent();
}

class AddNewAddress extends AddAddressEvent {}

class CheckFirstNameTextField extends AddAddressEvent {
  CheckFirstNameTextField({required this.text});

  final String text;
}

class CheckLastNameTextField extends AddAddressEvent {
  CheckLastNameTextField({required this.text});

  final String text;
}

class CheckAddressTextField extends AddAddressEvent {
  CheckAddressTextField({required this.text});

  final String text;
}

class CheckCityTextField extends AddAddressEvent {
  CheckCityTextField({required this.text});

  final String text;
}

class CheckStateTextField extends AddAddressEvent {
  CheckStateTextField({required this.text});

  final String text;
}

class CheckZipCodeTextField extends AddAddressEvent {
  CheckZipCodeTextField({required this.text});

  final String text;
}

class CheckPhoneTextField extends AddAddressEvent {
  CheckPhoneTextField({required this.text});

  final String text;
}

part of 'contact_us_bloc.dart';

sealed class ContactUsEvent extends Equatable {
  const ContactUsEvent();

  @override
  List<Object> get props => [];
}

class LoadContactUs extends ContactUsEvent {}

part of 'contact_us_bloc.dart';

sealed class ContactUsState extends Equatable {
  const ContactUsState();
  
  @override
  List<Object> get props => [];
}

final class ContactUsLoading extends ContactUsState {}
class ContactUsLoaded extends ContactUsState{
  const ContactUsLoaded({required this.contactus});
  final ContactUsModel contactus;
}
class ContactUsError extends ContactUsState{
  const ContactUsError({required this.error});
  final String? error;
}

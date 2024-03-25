part of 'contact_us_bloc.dart';

sealed class ContactUsState extends Equatable {
  final ContactUsEntity ? contactus;
  final DioError ? error;
  const ContactUsState({this.contactus,this.error});
  
  @override
  List<Object> get props => [contactus!,error!];
}

final class ContactUsLoading extends ContactUsState {}
class ContactUsLoaded extends ContactUsState{
  ContactUsLoaded(ContactUsEntity contactus):super(contactus: contactus);
}
class ContactUsError extends ContactUsState{
  ContactUsError(DioError error):super(error: error);
}

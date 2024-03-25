import 'package:equatable/equatable.dart';

class ContactUsEntity extends Equatable{
  ContactUsEntity({
    this.chat,
    this.text,
    this.email
  });
  String? chat;
  String? text;
  final EmailEntity? email;

  @override
  List<Object?> get props => [chat,text,email];
}

class EmailEntity extends Equatable{
  EmailEntity({
    this.facebook,
    this.twitter,
    this.end
  });
  String? facebook;
  String? twitter;
  String? end;

  @override
  List<Object?> get props =>[facebook,twitter,end];
}
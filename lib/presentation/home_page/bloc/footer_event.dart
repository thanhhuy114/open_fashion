part of 'footer_bloc.dart';

sealed class FooterEvent extends Equatable {
  const FooterEvent();

  @override
  List<Object> get props => [];
}
class LoadFooter extends FooterEvent{}
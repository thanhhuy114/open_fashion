part of 'footer_bloc.dart';

sealed class FooterEvent {
  const FooterEvent();

}
class GetFooter extends FooterEvent{
  GetFooter();
}
part of 'home_page_justforyou_bloc.dart';

sealed class HomePageJustforyouEvent {
  const HomePageJustforyouEvent();
}
class GetJustforyou extends HomePageJustforyouEvent{
  const GetJustforyou();
}
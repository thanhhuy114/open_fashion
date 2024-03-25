part of 'home_page_arrival_bloc.dart';

abstract class HomePageEvent {
  const HomePageEvent();
}
class GetArrivals extends HomePageEvent{
  GetArrivals();
}
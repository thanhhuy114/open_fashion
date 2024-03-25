part of 'home_page_followus_bloc.dart';

sealed class HomePageFollowusEvent{
  const HomePageFollowusEvent();

}
class GetFollowus extends HomePageFollowusEvent{
  GetFollowus();
}

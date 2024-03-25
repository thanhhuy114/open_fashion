part of 'home_page_followus_bloc.dart';

sealed class HomePageFollowusState extends Equatable {
  const HomePageFollowusState({this.fu,this.error});
  final List<FollowUsEntity> ? fu;
  final DioError ? error;
  @override
  List<Object> get props => [fu!,error!];
}

final class HomePageFollowusLoading extends HomePageFollowusState {}
class HomePageFollowUsLoaded extends HomePageFollowusState{
  const HomePageFollowUsLoaded(final List<FollowUsEntity> followus):super(fu: followus);
}
class HomePageFollowUsError extends HomePageFollowusState{
  const HomePageFollowUsError(final DioError error):super(error: error);
}
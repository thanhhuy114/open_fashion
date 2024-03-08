part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoaded extends HomePageState {
  const HomePageLoaded(
      {this.menuArrival = const <ArrivalModel>[],
      this.jfu = const <JustForYouModel>[],
      this.fu = const <FollowUsModel>[],});
  final List<ArrivalModel> menuArrival;
  final List<JustForYouModel> jfu;
  final List<FollowUsModel> fu;
}

class HomePageError extends HomePageState {
  const HomePageError({required this.error});
  final String? error;
}

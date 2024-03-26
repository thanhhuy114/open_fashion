part of 'home_page_arrival_bloc.dart';

sealed class HomePageArrivalState extends Equatable {
  const HomePageArrivalState({this.arrival,this.error});
  final List<ArrivalEntity> ? arrival;
  final DioError? error;

  @override
  List<Object> get props => [arrival!,error!];
}

class HomePageArrivalLoading extends HomePageArrivalState {
  const HomePageArrivalLoading();
}

class HomePageArrivalLoaded extends HomePageArrivalState {
  HomePageArrivalLoaded(List<ArrivalEntity> arrival):super(arrival: arrival);
  /* const HomePageLoaded(
      {this.menuArrival = const <ArrivalModel>[],
      this.jfu = const <JustForYouModel>[],
      this.fu = const <FollowUsModel>[],});
  final List<ArrivalModel> menuArrival;
  final List<JustForYouModel> jfu;
  final List<FollowUsModel> fu; */
}

class HomePageArrivalError extends HomePageArrivalState {
  HomePageArrivalError(DioError error):super(error: error);
  /* const HomePageError({required this.error});
  @override
  final String? error; */
}

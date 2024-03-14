abstract class RecentSearchState {}

class RecentSearchStateLoading extends RecentSearchState {}

class RecentSearchStateInitial extends RecentSearchState {}

class RecentSearchStateSucces extends RecentSearchState {
  RecentSearchStateSucces({required this.recentSearchs});

  final List<String> recentSearchs;
}

class RecentSearchStateFailure extends RecentSearchState {}

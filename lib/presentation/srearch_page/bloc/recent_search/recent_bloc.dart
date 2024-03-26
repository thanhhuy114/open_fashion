import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../network/api.dart';
import 'recent_event.dart';
import 'recent_state.dart';

class RecentSearchBloc extends Bloc<RecentSearchEvent, RecentSearchState> {
  RecentSearchBloc() : super(RecentSearchStateInitial()) {
    on<RecentSearchEventLoad>((final event, final emit) async {
      emit(RecentSearchStateLoading());

      try {
        final recentSearchResponse = await Api.getRecentSearch();

        final List<String> recentSearchs = recentSearchResponse!
            .data!.recentSearch
            .map((final element) => element.text!)
            .toList();

        emit(RecentSearchStateSucces(recentSearchs: recentSearchs));
      } catch (_) {
        emit(RecentSearchStateFailure());
      }
    });

    on<RecenSearchEventDelete>((final event, final emit) async {
      final List<String> recentSearchs = event.recenSearchs;

      recentSearchs.removeWhere((final element) => element == (event.item));

      emit(RecentSearchStateSucces(recentSearchs: recentSearchs));
    });
  }
}

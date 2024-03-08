import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/menu_arrival_response_model.dart';
import '../../../network/api.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageLoading()) {
    on<LoadHomePage>(_onHomePage);
  }
  final Api api = Api();
  Future<void> _onHomePage(
    final LoadHomePage event,
    final Emitter<HomePageState> emit,
  ) async {
    emit(HomePageLoading());
    try {
      final data = await api.getMenuArrival();
      emit(
        HomePageLoaded(
          menuArrival: data!.data!.arrival,
          jfu: data.data!.justforyou,
          fu: data.data!.followus,
        ),
      );
    } catch (e) {
      emit(HomePageError(error: e.toString()));
    }
  }
}

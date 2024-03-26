
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/arrival.dart';
import '../../domain/usecases/get_arrival.dart';

part 'home_page_arrival_event.dart';
part 'home_page_arrival_state.dart';

class HomePageArrivalBloc extends Bloc<HomePageEvent, HomePageArrivalState> {
  HomePageArrivalBloc(this._getArrivalUseCase):super(const HomePageArrivalLoading()){
    on<GetArrivals>(onGetArrivals);
  }
  final GetArrivalUseCase _getArrivalUseCase;

  Future<void> onGetArrivals(final GetArrivals event, final Emitter<HomePageArrivalState> emit) async{
    final dataState = await _getArrivalUseCase();
    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(HomePageArrivalLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(HomePageArrivalError(dataState.error!));
    }
  }
  /* HomePageBloc() : super(HomePageLoading()) {
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
  } */
}

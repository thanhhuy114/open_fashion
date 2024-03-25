import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/arrival.dart';
import '../../domain/usecases/get_justforyou.dart';

part 'home_page_justforyou_event.dart';
part 'home_page_justforyou_state.dart';

class HomePageJustforyouBloc extends Bloc<HomePageJustforyouEvent, HomePageJustforyouState> {
  final GetJustForYouUseCase _getJustForYouUseCase;
  HomePageJustforyouBloc(this._getJustForYouUseCase) : super(HomePageJFULoading()) {
    on<GetJustforyou>(onGetJustforyou);
  }

  void onGetJustforyou(GetJustforyou event, Emitter<HomePageJustforyouState> emit) async {
    final dataState = await _getJustForYouUseCase();
    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(HomePageJFULoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(HomePageJFUError(dataState.error!));
    }
  }
}

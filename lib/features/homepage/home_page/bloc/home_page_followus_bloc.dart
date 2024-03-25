import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/arrival.dart';
import '../../domain/usecases/get_followus.dart';
part 'home_page_followus_event.dart';
part 'home_page_followus_state.dart';

class HomePageFollowusBloc extends Bloc<HomePageFollowusEvent, HomePageFollowusState> {
  HomePageFollowusBloc(this._getFollowUsUseCase) : super(HomePageFollowusLoading()) {
    on<HomePageFollowusEvent>((final event, final emit) async {
      final dataState = await _getFollowUsUseCase();
      if(dataState is DataSuccess && dataState.data!.isNotEmpty){
        emit(HomePageFollowUsLoaded(dataState.data!));
      }
      if(dataState is DataFailed){
        emit(HomePageFollowUsError(dataState.error!));
      }
    });
  }
  final GetFollowUsUseCase _getFollowUsUseCase;
}

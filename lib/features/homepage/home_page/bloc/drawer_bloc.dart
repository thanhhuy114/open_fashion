import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/resources/data_state.dart';
import '../../../drawer/domain/drawer.dart';
import '../../../drawer/domain/get_drawer.dart';
import '../../../../network/api.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc(this._getDrawerUseCase) : super(DrawerLoading()) {
    on<DrawerEvent>((final event, final emit) async {
      final dataState = await _getDrawerUseCase();
      if(dataState is DataSuccess && dataState.data!.isNotEmpty){
        emit(DrawerLoaded(dataState.data!));
      }
      if(dataState is DataFailed){
        emit(DrawerError(dataState.error!));
      }
    });
  }
  final GetDrawerUseCase _getDrawerUseCase;
}

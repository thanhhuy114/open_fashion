import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../network/api.dart';
import '../../../footer/domain/footer.dart';
import '../../../footer/domain/get_footer.dart';

part 'footer_event.dart';
part 'footer_state.dart';

class FooterBloc extends Bloc<FooterEvent, FooterState> {
  FooterBloc(this._getFooterUseCase) : super(FooterLoading()) {
    on<FooterEvent>((final event, final emit) async {
      final dataState = await _getFooterUseCase();
      if(dataState is DataSuccess && dataState.data!=null){
        emit(FooterLoaded(dataState.data!));
      }
      if(dataState is DataFailed){
        emit(FooterError(dataState.error!));
      }
    });
  }
  final GetFooterUseCase _getFooterUseCase;
}

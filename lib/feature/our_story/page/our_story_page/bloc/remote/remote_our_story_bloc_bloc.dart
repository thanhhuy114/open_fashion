import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../ultis/resources/data_state.dart';
import '../../../../domain/entities/our_story.dart';
import '../../../../domain/usecases/get_our_story.dart';

part 'remote_our_story_bloc_event.dart';
part 'remote_our_story_bloc_state.dart';

class RemoteOurStoryBloc
    extends Bloc<RemoteOurStoryBlocEvent, RemoteOurStoryBlocState> {
  RemoteOurStoryBloc(this._getOurStoryUsecase)
      : super(const RemoteOurStoryBlocLoading()) {
    on<GetOurStory>(_onGetOurStory);
  }
  final GetOurStoryUseCase _getOurStoryUsecase;

  FutureOr<void> _onGetOurStory(
    final GetOurStory event,
    final Emitter<RemoteOurStoryBlocState> emit,
  ) async {
    emit(const RemoteOurStoryBlocLoading());

    try {
      final dataState = await _getOurStoryUsecase();
      if (dataState is DataSuccess) {
        emit(RemoteOurStoryBlocDone(dataState.data!.data!));
      }
      if (dataState is DataFailed) {
        emit(const RemoteOurStoryBlocError());
      }
    } catch (e) {
      emit(const RemoteOurStoryBlocError());
    }
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/our_story_response_model.dart';
import '../../../network/api.dart';
part 'our_story_event.dart';
part 'our_story_state.dart';

class OurStoryBloc extends Bloc<OurStoryEvent, OurStoryState> {
  OurStoryBloc() : super(OurStoryLoadingState()) {
    on<OurStoryEvent>(_onOurStoryLoaded);
  }

  FutureOr<void> _onOurStoryLoaded(
    final OurStoryEvent event,
    final Emitter<OurStoryState> emit,
  ) async {
    emit(OurStoryLoadingState());
    try {
      final ourStoryData = await Api.getOurStory();
      emit(OurStoryLoadedState(ourStoryModel: ourStoryData.data));
    } catch (e) {
      emit(OurStoryErrorState(errorMessage: e.toString()));
    }
  }
}

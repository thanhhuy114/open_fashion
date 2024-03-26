part of 'remote_our_story_bloc_bloc.dart';

sealed class RemoteOurStoryBlocEvent extends Equatable {
  const RemoteOurStoryBlocEvent();

  @override
  List<Object> get props => [];
}

class GetOurStory extends RemoteOurStoryBlocEvent {
  const GetOurStory();
}

part of 'remote_our_story_bloc_bloc.dart';

sealed class RemoteOurStoryBlocState extends Equatable {
  const RemoteOurStoryBlocState({this.ourStory, this.error});
  final OurStoryEntity? ourStory;
  final DioException? error;
  @override
  List<Object> get props => [ourStory!, error!];
}

final class RemoteOurStoryBlocLoading extends RemoteOurStoryBlocState {
  const RemoteOurStoryBlocLoading();
}

final class RemoteOurStoryBlocDone extends RemoteOurStoryBlocState {
  const RemoteOurStoryBlocDone(final OurStoryEntity ourStory)
      : super(ourStory: ourStory);
}

final class RemoteOurStoryBlocError extends RemoteOurStoryBlocState {
  const RemoteOurStoryBlocError();
}

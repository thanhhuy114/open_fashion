part of 'our_story_bloc.dart';

sealed class OurStoryState extends Equatable {
  const OurStoryState();

  @override
  List<Object> get props => [];
}

final class OurStoryLoadingState extends OurStoryState {}

final class OurStoryLoadedState extends OurStoryState {
  const OurStoryLoadedState({this.ourStoryModel});
  final OurStoryModel? ourStoryModel;
  @override
  List<Object> get props => [ourStoryModel!];
}

final class OurStoryErrorState extends OurStoryState {
  const OurStoryErrorState({this.errorMessage});
  final String? errorMessage;
  @override
  List<Object> get props => [errorMessage!];
}

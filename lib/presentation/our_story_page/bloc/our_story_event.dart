part of 'our_story_bloc.dart';

sealed class OurStoryEvent extends Equatable {
  const OurStoryEvent();

  @override
  List<Object> get props => [];
}

class OurStoryLoadedEvent extends OurStoryEvent {}

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/post_menu_response_model.dart';
import '../../../../network/api.dart';
import 'post_menu_event.dart';
import 'post_menu_state.dart';

class PostMenuBloc extends Bloc<PostMenuEvent, PostMenuState> {
  PostMenuBloc() : super(PostMenuStateInitial()) {
    on<PostMenuEventStarted>(_onStarted);
  }

  FutureOr<void> _onStarted(final event, final Emitter emit) async {
    emit(PostMenuStateLoading());

    PostMenuResponseModel? postMenu;

    Future<void> fetchData() async {
      postMenu = await Api.fetchPostMenu();
    }

    await Future.wait([
      fetchData(),
      Future.delayed(const Duration(seconds: 4)),
    ]);

    if (postMenu == null) {
      return emit(PostMenuStateFailure());
    }

    if (postMenu!.code == 1) {
      return emit(
        PostMenuStateSussess(
          postMenuResponse: postMenu!,
          tags: getTags(postMenu!),
        ),
      );
    }
    return emit(PostMenuStateFailure());
  }
}

List<String> getTags(final PostMenuResponseModel postMenuResponse) {
  final List<String> tags = [];

  for (final post in postMenuResponse.data!.postSummaru) {
    for (final tag in post.tags) {
      if (!tags.contains(tag)) {
        tags.add(tag);
      }
    }
  }
  return tags;
}

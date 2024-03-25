import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../ultis/resources/data_state.dart';
import '../../../../data/models/blog_post.dart';
import '../../../../domain/usecases/get_blog_post_usecase.dart';
part 'blog_post_event.dart';
part 'blog_post_state.dart';

class BlogPostBloc extends Bloc<BlogPostEvent, BlogPostState> {
  BlogPostBloc(this._getBlogPostUseCase) : super(BlogPostLoading()) {
    on<LoadBlogPostEvent>(_getBlogPost);
  }
  final GetBlogPostUseCase _getBlogPostUseCase;

  Future _getBlogPost(
    final LoadBlogPostEvent event,
    final Emitter<BlogPostState> emit,
  ) async {
    final dataState = await _getBlogPostUseCase();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(BlogPostLoaded(dataState.data!.data!));
    } else {
      emit(BlogPostLoadFailure());
    }
  }
}

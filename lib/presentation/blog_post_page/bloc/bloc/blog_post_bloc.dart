import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/blog_post.dart';
import '../../../../network/api.dart';
part 'blog_post_event.dart';
part 'blog_post_state.dart';

class BlogPostBloc extends Bloc<BlogPostEvent, BlogPostState> {
  BlogPostBloc() : super(BlogPostLoading()) {
    on<LoadBlogPostEvent>(_getBlogPost);
  }

  Future _getBlogPost(
    final LoadBlogPostEvent event,
    final Emitter<BlogPostState> emit,
  ) async {
    final blogPost = await Api.getBlogPost();
    if (blogPost!.data != null) {
      emit(BlogPostLoaded(blogPost.data!));
    } else {
      emit(BlogPostLoadFailure());
    }
  }
}

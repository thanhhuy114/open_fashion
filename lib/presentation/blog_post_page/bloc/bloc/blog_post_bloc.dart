import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_fashion/models/blog_post.dart';
import 'package:open_fashion/network/api.dart';

part 'blog_post_event.dart';
part 'blog_post_state.dart';

class BlogPostBloc extends Bloc<BlogPostEvent, BlogPostState> {
  BlogPostBloc() : super(BlogPostLoading()) {
    on<LoadBlogPostEvent>(_getBlogPost);
  }

  _getBlogPost(LoadBlogPostEvent event, Emitter<BlogPostState> emit) async {
    final blogPost = await Api.getBlogPost();
    if (blogPost!.data != null) {
      emit(BlogPostLoaded(blogPost.data!));
    } else {
      emit(BlogPostLoadFailure());
    }
  }
}

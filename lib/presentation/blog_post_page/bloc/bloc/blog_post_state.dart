part of 'blog_post_bloc.dart';

abstract class BlogPostState extends Equatable {
  const BlogPostState();

  @override
  List<Object> props() => [];
}

class BlogPostLoading extends BlogPostState {}

class BlogPostLoaded extends BlogPostState {
  final BlogPostModel blogPost;

  const BlogPostLoaded(this.blogPost);

  @override
  List<Object> props() => [blogPost];
}

class BlogPostLoadFailure extends BlogPostState {}

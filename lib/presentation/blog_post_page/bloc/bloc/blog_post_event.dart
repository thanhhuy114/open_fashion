part of 'blog_post_bloc.dart';

abstract class BlogPostEvent extends Equatable {
  const BlogPostEvent();

  @override
  List<Object> props() => [];
}

class LoadBlogPostEvent extends BlogPostEvent {}

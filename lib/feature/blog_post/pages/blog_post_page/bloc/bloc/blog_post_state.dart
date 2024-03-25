part of 'blog_post_bloc.dart';

abstract class BlogPostState extends Equatable {
  const BlogPostState();

  @override
  List<Object> get props => [];
}

class BlogPostLoading extends BlogPostState {}

class BlogPostLoaded extends BlogPostState {
  const BlogPostLoaded(this.blogPost);
  final BlogPostEntity blogPost;

  @override
  List<Object> get props => [blogPost];
}

class BlogPostLoadFailure extends BlogPostState {}

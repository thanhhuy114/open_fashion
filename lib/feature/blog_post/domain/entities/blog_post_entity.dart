// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BlogPostEntity extends Equatable {
  final String? postBy;
  final String? titlePost;
  final String? content;
  final String? mainPicture;
  final List<String>? imageArray;
  final String? postDate;
  final List<String>? tag;
  BlogPostEntity({
    this.postBy,
    this.titlePost,
    this.content,
    this.mainPicture,
    this.imageArray,
    this.postDate,
    this.tag,
  });

  @override
  List<Object?> get props => [
        postBy,
        titlePost,
        content,
        mainPicture,
        imageArray,
        postDate,
        tag,
      ];
}

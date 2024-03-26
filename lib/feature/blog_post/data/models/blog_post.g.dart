// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BLogPostResponseModel _$BLogPostResponseModelFromJson(
        Map<String, dynamic> json) =>
    BLogPostResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : BlogPostModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BLogPostResponseModelToJson(
        BLogPostResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

BlogPostModel _$BlogPostModelFromJson(Map<String, dynamic> json) =>
    BlogPostModel(
      postBy: json['post_by'] as String?,
      titlePost: json['title_post'] as String?,
      content: json['content'] as String?,
      mainPicture: json['main_picture'] as String?,
      imageArray: (json['image_array'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      postDate: json['post_date'] as String?,
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BlogPostModelToJson(BlogPostModel instance) =>
    <String, dynamic>{
      'post_by': instance.postBy,
      'title_post': instance.titlePost,
      'content': instance.content,
      'main_picture': instance.mainPicture,
      'image_array': instance.imageArray,
      'post_date': instance.postDate,
      'tag': instance.tag,
    };

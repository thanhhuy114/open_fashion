// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_menu_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostMenuResponseModel _$PostMenuResponseModelFromJson(
        Map<String, dynamic> json) =>
    PostMenuResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : PostMenuModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostMenuResponseModelToJson(
        PostMenuResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

PostMenuModel _$PostMenuModelFromJson(Map<String, dynamic> json) =>
    PostMenuModel(
      postSummaru: (json['posts'] as List<dynamic>)
          .map((e) => PostSummaryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostMenuModelToJson(PostMenuModel instance) =>
    <String, dynamic>{
      'posts': instance.postSummaru,
    };

PostSummaryModel _$PostSummaryModelFromJson(Map<String, dynamic> json) =>
    PostSummaryModel(
      description: json['description'] as String,
      imageUrlTypeGird: json['image_url_type_gird'] as String,
      tittle: json['title'] as String,
      datePublished: json['date_published'] as String,
      imageUrl: json['image_url'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostSummaryModelToJson(PostSummaryModel instance) =>
    <String, dynamic>{
      'title': instance.tittle,
      'description': instance.description,
      'image_url_type_gird': instance.imageUrlTypeGird,
      'date_published': instance.datePublished,
      'image_url': instance.imageUrl,
      'tags': instance.tags,
    };

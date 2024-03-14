// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'our_story_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OurStoryResponseModel _$OurStoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    OurStoryResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : OurStoryModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OurStoryResponseModelToJson(
        OurStoryResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

OurStoryModel _$OurStoryModelFromJson(Map<String, dynamic> json) =>
    OurStoryModel(
      ourStory:
          OurStoryInfoModel.fromJson(json['our_story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OurStoryModelToJson(OurStoryModel instance) =>
    <String, dynamic>{
      'our_story': instance.ourStory,
    };

OurStoryInfoModel _$OurStoryInfoModelFromJson(Map<String, dynamic> json) =>
    OurStoryInfoModel(
      openMessage: json['open_message'] as String,
      createMessage: json['create_message'] as String,
      images: ImageModel.fromJson(json['images'] as Map<String, dynamic>),
      signUp: json['sign_up'] as String,
    );

Map<String, dynamic> _$OurStoryInfoModelToJson(OurStoryInfoModel instance) =>
    <String, dynamic>{
      'open_message': instance.openMessage,
      'create_message': instance.createMessage,
      'images': instance.images,
      'sign_up': instance.signUp,
    };

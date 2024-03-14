// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentSearchResponseModel _$RecentSearchResponseModelFromJson(
        Map<String, dynamic> json) =>
    RecentSearchResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : RecentSearchModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentSearchResponseModelToJson(
        RecentSearchResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

RecentSearchModel _$RecentSearchModelFromJson(Map<String, dynamic> json) =>
    RecentSearchModel(
      recentSearch: (json['recent_search'] as List<dynamic>)
          .map((e) => RecentSearchItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecentSearchModelToJson(RecentSearchModel instance) =>
    <String, dynamic>{
      'recent_search': instance.recentSearch,
    };

RecentSearchItemModel _$RecentSearchItemModelFromJson(
        Map<String, dynamic> json) =>
    RecentSearchItemModel(
      id: json['id'] as int?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$RecentSearchItemModelToJson(
        RecentSearchItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };

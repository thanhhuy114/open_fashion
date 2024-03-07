// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_arrival_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuArrivalResponseModel _$MenuArrivalResponseModelFromJson(
        Map<String, dynamic> json) =>
    MenuArrivalResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MenuArrivalModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MenuArrivalResponseModelToJson(
        MenuArrivalResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

MenuArrivalModel _$MenuArrivalModelFromJson(Map<String, dynamic> json) =>
    MenuArrivalModel(
      arrival: (json['arrival'] as List<dynamic>)
          .map((e) => ArrivalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      justforyou: (json['justforyou'] as List<dynamic>)
          .map((e) => JustForYouModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      followus: (json['followus'] as List<dynamic>)
          .map((e) => FollowUsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuArrivalModelToJson(MenuArrivalModel instance) =>
    <String, dynamic>{
      'arrival': instance.arrival,
      'justforyou': instance.justforyou,
      'followus': instance.followus,
    };

ArrivalModel _$ArrivalModelFromJson(Map<String, dynamic> json) => ArrivalModel(
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArrivalModelToJson(ArrivalModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'items': instance.items,
    };

ItemsModel _$ItemsModelFromJson(Map<String, dynamic> json) => ItemsModel(
      image: json['image'] as String,
      content: json['content'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$ItemsModelToJson(ItemsModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'content': instance.content,
      'price': instance.price,
    };

JustForYouModel _$JustForYouModelFromJson(Map<String, dynamic> json) =>
    JustForYouModel(
      image: json['image'] as String,
      content: json['content'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$JustForYouModelToJson(JustForYouModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'content': instance.content,
      'price': instance.price,
    };

FollowUsModel _$FollowUsModelFromJson(Map<String, dynamic> json) =>
    FollowUsModel(
      image: json['image'] as String,
      tag: json['tag'] as String,
    );

Map<String, dynamic> _$FollowUsModelToJson(FollowUsModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'tag': instance.tag,
    };

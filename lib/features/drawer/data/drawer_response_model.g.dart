// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrawerResponseModel _$DrawerResponseModelFromJson(Map<String, dynamic> json) =>
    DrawerResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DrawerDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DrawerResponseModelToJson(
        DrawerResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

DrawerDataModel _$DrawerDataModelFromJson(Map<String, dynamic> json) =>
    DrawerDataModel(
      drawer: (json['drawer'] as List<dynamic>)
          .map((e) => DrawerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrawerDataModelToJson(DrawerDataModel instance) =>
    <String, dynamic>{
      'drawer': instance.drawer,
    };

DrawerModel _$DrawerModelFromJson(Map<String, dynamic> json) => DrawerModel(
      type: json['type'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemsDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrawerModelToJson(DrawerModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'items': instance.items,
    };

ItemsDataModel _$ItemsDataModelFromJson(Map<String, dynamic> json) =>
    ItemsDataModel(
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemsDrawerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsDataModelToJson(ItemsDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'items': instance.items,
    };

ItemsDrawerModel _$ItemsDrawerModelFromJson(Map<String, dynamic> json) =>
    ItemsDrawerModel(
      item: json['item'] as String,
    );

Map<String, dynamic> _$ItemsDrawerModelToJson(ItemsDrawerModel instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

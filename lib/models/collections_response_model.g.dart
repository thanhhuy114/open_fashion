// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionsResponseModel _$CollectionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    CollectionsResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => CollectionDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionsResponseModelToJson(
        CollectionsResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

CollectionDetailModel _$CollectionDetailModelFromJson(
        Map<String, dynamic> json) =>
    CollectionDetailModel(
      id: json['id'] as String?,
      collectionName: json['collection_name'] as String?,
      collectionImage: json['collection_image'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map(
              (e) => ItemOfCollectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionDetailModelToJson(
        CollectionDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collection_name': instance.collectionName,
      'collection_image': instance.collectionImage,
      'items': instance.items,
    };

ItemOfCollectionModel _$ItemOfCollectionModelFromJson(
        Map<String, dynamic> json) =>
    ItemOfCollectionModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemOfCollectionModelToJson(
        ItemOfCollectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_layout_response_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailLayoutResponseModel _$ProductDetailLayoutResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductDetailLayoutResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProductDetailLayoutModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailLayoutResponseModelToJson(
        ProductDetailLayoutResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ProductDetailLayoutModel _$ProductDetailLayoutModelFromJson(
        Map<String, dynamic> json) =>
    ProductDetailLayoutModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      ringSize: (json['ring_size'] as List<dynamic>?)
          ?.map((e) => SizeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      carePolicy: json['care_policy'] == null
          ? null
          : CarePolicyModel.fromJson(
              json['care_policy'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailLayoutModelToJson(
        ProductDetailLayoutModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'ring_size': instance.ringSize,
      'gallery': instance.gallery,
      'image': instance.image,
      'care_policy': instance.carePolicy,
      'isFavorite': instance.isFavorite,
      'categories': instance.categories,
    };

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
      productItem: json['product_item'] == null
          ? null
          : ProductItem.fromJson(json['product_item'] as Map<String, dynamic>),
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
      'product_item': instance.productItem,
      'ring_size': instance.ringSize,
      'gallery': instance.gallery,
      'image': instance.image,
      'care_policy': instance.carePolicy,
      'isFavorite': instance.isFavorite,
      'categories': instance.categories,
    };

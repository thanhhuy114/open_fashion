// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_response_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailResponseModel _$ProductDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductDetailResponseModel(
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : ProductDetailModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ProductDetailResponseModelToJson(
        ProductDetailResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      ProductItem.fromJson(json['product_item'] as Map<String, dynamic>),
      (json['color'] as List<dynamic>)
          .map((e) => ColorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['size'] as List<dynamic>)
          .map((e) => SizeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['material'] as String?,
      CareModel.fromJson(json['care'] as Map<String, dynamic>),
      json['is_favorite'] as bool?,
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'product_item': instance.productItem,
      'color': instance.color,
      'size': instance.size,
      'material': instance.material,
      'care': instance.care,
      'is_favorite': instance.isFavorite,
      'categories': instance.categories,
    };

ColorModel _$ColorModelFromJson(Map<String, dynamic> json) => ColorModel(
      json['id'] as int?,
      json['name'] as String?,
      (json['image'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ColorModelToJson(ColorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

SizeModel _$SizeModelFromJson(Map<String, dynamic> json) => SizeModel(
      json['size'] as String,
    );

Map<String, dynamic> _$SizeModelToJson(SizeModel instance) => <String, dynamic>{
      'size': instance.size,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      json['url'] as String?,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

CareModel _$CareModelFromJson(Map<String, dynamic> json) => CareModel(
      json['cleaning'] as String?,
      json['do_not_use'] as String?,
      json['do_not'] as String?,
      json['dry_clean_with'] as String?,
      json['iron_at_max_temperature'] as String?,
      CarePolicyModel.fromJson(json['care_policy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CareModelToJson(CareModel instance) => <String, dynamic>{
      'cleaning': instance.cleaning,
      'do_not_use': instance.doNotUse,
      'do_not': instance.doNot,
      'dry_clean_with': instance.dryCleanWith,
      'iron_at_max_temperature': instance.ironAtMaxTemperature,
      'care_policy': instance.carePolicy,
    };

CarePolicyModel _$CarePolicyModelFromJson(Map<String, dynamic> json) =>
    CarePolicyModel(
      json['shipping_info'] as String?,
      json['COD_policy'] as String?,
      json['return_policy'] as String?,
    );

Map<String, dynamic> _$CarePolicyModelToJson(CarePolicyModel instance) =>
    <String, dynamic>{
      'shipping_info': instance.shippingInfo,
      'COD_policy': instance.codPolicy,
      'return_policy': instance.returnPolicy,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      json['name'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['image'] as String?,
      json['is_favorite'] as bool?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'is_favorite': instance.isFavorite,
    };

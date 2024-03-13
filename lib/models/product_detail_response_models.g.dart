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
      productItem:
          ProductItem.fromJson(json['product_item'] as Map<String, dynamic>),
      color: (json['color'] as List<dynamic>)
          .map((e) => ColorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      size: (json['size'] as List<dynamic>)
          .map((e) => SizeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      material: json['material'] as String,
      care: CareModel.fromJson(json['care'] as Map<String, dynamic>),
      isFavorite: json['is_favorite'] as bool,
      categories: (json['categories'] as List<dynamic>)
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
      id: json['id'] as int,
      name: json['name'] as String,
      image: (json['image'] as List<dynamic>)
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
      size: json['size'] as String,
    );

Map<String, dynamic> _$SizeModelToJson(SizeModel instance) => <String, dynamic>{
      'size': instance.size,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

CareModel _$CareModelFromJson(Map<String, dynamic> json) => CareModel(
      cleaning: json['cleaning'] as String,
      doNotUse: json['do_not_use'] as String,
      doNot: json['do_not'] as String,
      dryCleanWith: json['dry_clean_with'] as String,
      ironAtMaxTemperature: json['iron_at_max_temperature'] as String,
      carePolicy:
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
      shippingInfo: json['shipping_info'] as String,
      codPolicy: json['COD_policy'] as String,
      returnPolicy: json['return_policy'] as String,
    );

Map<String, dynamic> _$CarePolicyModelToJson(CarePolicyModel instance) =>
    <String, dynamic>{
      'shipping_info': instance.shippingInfo,
      'COD_policy': instance.codPolicy,
      'return_policy': instance.returnPolicy,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      isFavorite: json['is_favorite'] as bool,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'is_favorite': instance.isFavorite,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteCheckoutResponeModel _$CompleteCheckoutResponeModelFromJson(
        Map<String, dynamic> json) =>
    CompleteCheckoutResponeModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CompleteCheckoutModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompleteCheckoutResponeModelToJson(
        CompleteCheckoutResponeModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

CompleteCheckoutModel _$CompleteCheckoutModelFromJson(
        Map<String, dynamic> json) =>
    CompleteCheckoutModel(
      checkout: CompleteCheckoutModelInfo.fromJson(
          json['checkout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompleteCheckoutModelToJson(
        CompleteCheckoutModel instance) =>
    <String, dynamic>{
      'checkout': instance.checkout,
    };

CompleteCheckoutModelInfo _$CompleteCheckoutModelInfoFromJson(
        Map<String, dynamic> json) =>
    CompleteCheckoutModelInfo(
      address: json['address'] as String,
      addressDetail: json['address_detail'] as String,
      phoneNumber: json['phone_number'] as String,
      masterCard: json['master_card'] as String,
      product: (json['product'] as List<dynamic>)
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompleteCheckoutModelInfoToJson(
        CompleteCheckoutModelInfo instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address_detail': instance.addressDetail,
      'phone_number': instance.phoneNumber,
      'master_card': instance.masterCard,
      'product': instance.product,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      image: ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
    };

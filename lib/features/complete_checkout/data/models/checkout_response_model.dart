// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../product_detail/data/models/product_detail_response_models.dart';
import '../../domain/entities/complete_checkout.dart';

part 'checkout_response_model.g.dart';

@JsonSerializable()
class CompleteCheckoutResponeModel extends Equatable {
  CompleteCheckoutResponeModel({this.code, this.message, this.data});

  factory CompleteCheckoutResponeModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$CompleteCheckoutResponeModelFromJson(json);
  int? code;
  String? message;
  CompleteCheckoutModel? data;

  @override
  List<Object?> get props => [code, message, data];
}

@JsonSerializable()
class CompleteCheckoutModel extends CompleteCheckoutEntity {
  CompleteCheckoutModel(final CompleteCheckoutModelInfo checkout)
      : super(checkout: checkout);

  factory CompleteCheckoutModel.fromJson(final Map<String, dynamic> json) =>
      _$CompleteCheckoutModelFromJson(json);
}

@JsonSerializable()
class CompleteCheckoutModelInfo extends CompleteCheckoutInfoEntity {
  CompleteCheckoutModelInfo(
    final String? address,
    final String? addressDetail,
    final String? phoneNumber,
    final String? masterCard,
    final List<ProductItem> product,
  ) : super(
          address: address,
          addressDetail: addressDetail,
          phoneNumber: phoneNumber,
          masterCard: masterCard,
          product: product,
        );

  factory CompleteCheckoutModelInfo.fromJson(final Map<String, dynamic> json) =>
      _$CompleteCheckoutModelInfoFromJson(json);
}

@JsonSerializable()
class ProductItem extends ProductItemEntity {
  ProductItem(
    final ImageModel image,
    final String? name,
    final String? description,
    final double? price,
  ) : super(image: image, name: name, description: description, price: price);

  factory ProductItem.fromJson(final Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';

import 'product_detail_response_models.dart';

part 'checkout_response_model.g.dart';

@JsonSerializable()
class CompleteCheckoutResponeModel {
  CompleteCheckoutResponeModel({this.code, this.message, this.data});

  factory CompleteCheckoutResponeModel.fromJson(
          final Map<String, dynamic> json) =>
      _$CheckoutResponeModelFromJson(json);
  int? code;
  String? message;
  CompleteCheckoutModel? data;
}

@JsonSerializable()
class CompleteCheckoutModel {
  CompleteCheckoutModel({this.checkout});

  factory CompleteCheckoutModel.fromJson(final Map<String, dynamic> json) =>
      _$CheckoutModelFromJson(json);
  CompleteCheckoutModelInfo? checkout;
}

@JsonSerializable()
class CompleteCheckoutModelInfo {
  CompleteCheckoutModelInfo({
    this.address,
    this.addressDetail,
    this.phoneNumber,
    this.masterCard,
    this.product,
  });

  factory CompleteCheckoutModelInfo.fromJson(final Map<String, dynamic> json) =>
      _$CheckoutModelInfoFromJson(json);
  String? address;
  @JsonKey(name: 'address_detail')
  String? addressDetail;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'master_card')
  String? masterCard;
  List<ProductItem>? product;
}

@JsonSerializable()
class ProductItem {
  ProductItem({this.image, this.name, this.description, this.price});

  factory ProductItem.fromJson(final Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
  ImageModel? image;
  String? name;
  String? description;
  double? price;
}

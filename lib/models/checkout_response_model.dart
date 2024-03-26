import 'package:json_annotation/json_annotation.dart';

import '../feature/product_detail/data/models/product_detail_response_models.dart';

part 'checkout_response_model.g.dart';

@JsonSerializable()
class CompleteCheckoutResponeModel {
  CompleteCheckoutResponeModel({this.code, this.message, this.data});

  factory CompleteCheckoutResponeModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$CompleteCheckoutResponeModelFromJson(json);
  int? code;
  String? message;
  CompleteCheckoutModel? data;
}

@JsonSerializable()
class CompleteCheckoutModel {
  CompleteCheckoutModel({required this.checkout});

  factory CompleteCheckoutModel.fromJson(final Map<String, dynamic> json) =>
      _$CompleteCheckoutModelFromJson(json);
  CompleteCheckoutModelInfo checkout;
}

@JsonSerializable()
class CompleteCheckoutModelInfo {
  CompleteCheckoutModelInfo({
    required this.address,
    required this.addressDetail,
    required this.phoneNumber,
    required this.masterCard,
    required this.product,
  });

  factory CompleteCheckoutModelInfo.fromJson(final Map<String, dynamic> json) =>
      _$CompleteCheckoutModelInfoFromJson(json);
  String address;
  @JsonKey(name: 'address_detail')
  String addressDetail;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  @JsonKey(name: 'master_card')
  String masterCard;
  List<ProductItem> product;
}

@JsonSerializable()
class ProductItem {
  ProductItem({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  factory ProductItem.fromJson(final Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
  ImageModel image;
  String name;
  String description;
  double price;
}

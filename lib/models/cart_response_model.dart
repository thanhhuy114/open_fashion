import 'package:json_annotation/json_annotation.dart';

import 'checkout_response_model.dart';
part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel {
  CartResponseModel({this.code, this.message, this.data});
  factory CartResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);
  int? code;
  String? message;
  CartModel? data;
}

@JsonSerializable()
class CartModel {
  CartModel({this.cartInfoModel});
  factory CartModel.fromJson(final Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  @JsonKey(name: 'cart')
  List<ProductItem>? cartInfoModel;
}

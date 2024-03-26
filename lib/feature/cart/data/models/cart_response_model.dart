// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../complete_checkout/data/models/checkout_response_model.dart';
import '../../domain/entities/cart.dart';

part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel extends Equatable {
  CartResponseModel({this.code, this.message, this.data});
  factory CartResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);
  int? code;
  String? message;
  CartModel? data;

  @override
  List<Object?> get props => [code, message, data];
}

@JsonSerializable()
class CartModel extends CartEntity {
  CartModel(final List<ProductItem> cartInfoModel)
      : super(cartInfoModel: cartInfoModel);
  factory CartModel.fromJson(final Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

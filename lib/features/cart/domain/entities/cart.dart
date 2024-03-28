// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../complete_checkout/data/models/checkout_response_model.dart';


class CartEntity extends Equatable {
  CartEntity({required this.cartInfoModel});

  @JsonKey(name: 'cart')
  List<ProductItem> cartInfoModel;

  @override
  List<Object?> get props => [cartInfoModel];
}

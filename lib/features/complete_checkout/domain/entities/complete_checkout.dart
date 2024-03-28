// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../product_detail/data/models/product_detail_response_models.dart';
import '../../data/models/checkout_response_model.dart';

class CompleteCheckoutEntity extends Equatable {
  CompleteCheckoutEntity({required this.checkout});

  CompleteCheckoutModelInfo checkout;

  @override
  List<Object?> get props => [checkout];
}

class CompleteCheckoutInfoEntity extends Equatable {
  CompleteCheckoutInfoEntity({
    this.address,
    this.addressDetail,
    this.phoneNumber,
    this.masterCard,
    required this.product,
  });

  String? address;
  @JsonKey(name: 'address_detail')
  String? addressDetail;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'master_card')
  String? masterCard;
  List<ProductItem> product;

  @override
  List<Object?> get props =>
      [address, addressDetail, phoneNumber, masterCard, product];
}

class ProductItemEntity extends Equatable {
  ProductItemEntity({
    required this.image,
    this.name,
    this.description,
    this.price,
  });

  ImageModel image;
  String? name;
  String? description;
  double? price;

  @override
  List<Object?> get props => throw UnimplementedError();
}

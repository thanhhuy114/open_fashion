// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../complete_checkout/data/models/checkout_response_model.dart';
import '../../../product_detail/data/models/product_detail_response_models.dart';
import '../../domain/entities/product_detail_layout.dart';
part 'product_detail_layout_response_models.g.dart';

@JsonSerializable()
class ProductDetailLayoutResponseModel extends Equatable {
  ProductDetailLayoutResponseModel({this.code, this.message, this.data});

  factory ProductDetailLayoutResponseModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$ProductDetailLayoutResponseModelFromJson(json);
  int? code;
  String? message;
  ProductDetailLayoutModel? data;

  @override
  List<Object?> get props => [code, message, data];
}

@JsonSerializable()
class ProductDetailLayoutModel extends ProductDetailLayoutEntity {
  ProductDetailLayoutModel(
    final ProductItem productItem,
    final List<SizeModel> ringSize,
    final List<ImageModel> gallery,
    final List<ImageModel> image,
    final CarePolicyModel carePolicy,
    final bool? isFavorite,
    final List<CategoryModel> categories,
  ) : super(
          productItem: productItem,
          ringSize: ringSize,
          gallery: gallery,
          image: image,
          carePolicy: carePolicy,
          isFavorite: isFavorite,
          categories: categories,
        );

  factory ProductDetailLayoutModel.fromJson(final Map<String, dynamic> json) =>
      _$ProductDetailLayoutModelFromJson(json);
}

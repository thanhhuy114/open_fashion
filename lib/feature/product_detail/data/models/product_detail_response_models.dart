// ignore_for_file: avoid_positional_boolean_parameters, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../models/checkout_response_model.dart';
import '../../../our_story/domain/entities/our_story.dart';
import '../../domain/entities/product_detail_response.dart';

part 'product_detail_response_models.g.dart';

@JsonSerializable()
class ProductDetailResponseModel extends Equatable {
  ProductDetailResponseModel({this.code, this.data, this.message});
  factory ProductDetailResponseModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$ProductDetailResponseModelFromJson(json);
  int? code;
  String? message;
  ProductDetailModel? data;

  @override
  List<Object?> get props => [code, message, data];
}

@JsonSerializable()
class ProductDetailModel extends ProductDetailEntity {
  ProductDetailModel(
    final ProductItem productItem,
    final List<ColorModel> color,
    final List<SizeModel> size,
    final String? material,
    final CareModel care,
    final bool? isFavorite,
    final List<CategoryModel> categories,
  ) : super(
          productItem: productItem,
          color: color,
          size: size,
          material: material,
          care: care,
          isFavorite: isFavorite,
          categories: categories,
        );
  factory ProductDetailModel.fromJson(final Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);
}

@JsonSerializable()
class ColorModel extends ColorEntity {
  ColorModel(final int? id, final String? name, final List<ImageModel> image)
      : super(id: id, name: name, image: image);
  factory ColorModel.fromJson(final Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);
  // int id;
  // String name;
  // List<ImageModel> image;
}

@JsonSerializable()
class SizeModel extends SizeEntity {
  SizeModel(final String size) : super(size: size);
  factory SizeModel.fromJson(final Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);
}

@JsonSerializable()
class ImageModel extends ImageEntity {
  ImageModel(final String? url) : super(url: url);
  factory ImageModel.fromJson(final Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}

@JsonSerializable()
class CareModel extends CareEntity {
  CareModel(
    final String? cleaning,
    final String? doNotUse,
    final String? doNot,
    final String? dryCleanWith,
    final String? ironAtMaxTemperature,
    final CarePolicyModel carePolicy,
  ) : super(
          cleaning: cleaning,
          doNotUse: doNotUse,
          doNot: doNot,
          dryCleanWith: dryCleanWith,
          ironAtMaxTemperature: ironAtMaxTemperature,
          carePolicy: carePolicy,
        );

  factory CareModel.fromJson(final Map<String, dynamic> json) =>
      _$CareModelFromJson(json);
}

@JsonSerializable()
class CarePolicyModel extends CarePolicEntity {
  CarePolicyModel(
    final String? shippingInfo,
    final String? codPolicy,
    final String? returnPolicy,
  ) : super(
          shippingInfo: shippingInfo,
          codPolicy: codPolicy,
          returnPolicy: returnPolicy,
        );
  factory CarePolicyModel.fromJson(final Map<String, dynamic> json) =>
      _$CarePolicyModelFromJson(json);
}

@JsonSerializable()
class CategoryModel extends CategoryEntity {
  const CategoryModel(
    final String? name,
    final String? description,
    final double? price,
    final String? image,
    final bool? isFavorite,
  ) : super(
          name: name,
          description: description,
          price: price,
          image: image,
          isFavorite: isFavorite,
        );

  factory CategoryModel.fromJson(final Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

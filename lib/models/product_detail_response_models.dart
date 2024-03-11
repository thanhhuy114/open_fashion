import 'package:json_annotation/json_annotation.dart';

import 'checkout_response_model.dart';
part 'product_detail_response_models.g.dart';

@JsonSerializable()
class ProductDetailResponseModel {
  ProductDetailResponseModel({this.code, this.data, this.message});
  factory ProductDetailResponseModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$ProductDetailResponseModelFromJson(json);
  int? code;
  String? message;
  ProductDetailModel? data;
}

@JsonSerializable()
class ProductDetailModel {
  ProductDetailModel({
    this.productItem,
    this.color,
    this.size,
    this.material,
    this.care,
    this.isFavorite,
    this.categories,
  });
  factory ProductDetailModel.fromJson(final Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);
  @JsonKey(name: 'product_item')
  ProductItem? productItem;
  List<ColorModel>? color;
  List<SizeModel>? size;
  String? material;
  CareModel? care;
  @JsonKey(name: 'is_favorite')
  bool? isFavorite;
  List<CategoryModel>? categories;
}

@JsonSerializable()
class ColorModel {
  ColorModel({this.id, this.name, this.image});
  factory ColorModel.fromJson(final Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);
  int? id;
  String? name;
  List<ImageModel>? image;
}

@JsonSerializable()
class SizeModel {
  SizeModel({this.size});
  factory SizeModel.fromJson(final Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);
  String? size;
}

@JsonSerializable()
class ImageModel {
  ImageModel({this.url});
  factory ImageModel.fromJson(final Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  String? url;
}

@JsonSerializable()
class CareModel {
  CareModel({
    this.cleaning,
    this.doNotUse,
    this.doNot,
    this.dryCleanWith,
    this.ironAtMaxTemperature,
    this.carePolicy,
  });

  factory CareModel.fromJson(final Map<String, dynamic> json) =>
      _$CareModelFromJson(json);
  String? cleaning;
  @JsonKey(name: 'do_not_use')
  String? doNotUse;
  @JsonKey(name: 'do_not')
  String? doNot;
  @JsonKey(name: 'dry_clean_with')
  String? dryCleanWith;
  @JsonKey(name: 'iron_at_max_temperature')
  String? ironAtMaxTemperature;
  @JsonKey(name: 'care_policy')
  CarePolicyModel? carePolicy;
}

@JsonSerializable()
class CarePolicyModel {
  CarePolicyModel({this.shippingInfo, this.codPolicy, this.returnPolicy});
  factory CarePolicyModel.fromJson(final Map<String, dynamic> json) =>
      _$CarePolicyModelFromJson(json);
  @JsonKey(name: 'shipping_info')
  String? shippingInfo;
  @JsonKey(name: 'COD_policy')
  String? codPolicy;
  @JsonKey(name: 'return_policy')
  String? returnPolicy;
}

@JsonSerializable()
class CategoryModel {
  CategoryModel({
    this.name,
    this.description,
    this.price,
    this.image,
    this.isFavorite,
  });

  factory CategoryModel.fromJson(final Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  final String? name;
  final String? description;
  final double? price;
  final String? image;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
}

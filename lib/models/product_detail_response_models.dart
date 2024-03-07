import 'package:json_annotation/json_annotation.dart';
part 'product_detail_response_models.g.dart';

@JsonSerializable()
class ProductDetailResponseModel {
  int? code;
  String? message;
  ProductDetailModel? data;

  ProductDetailResponseModel({this.code, this.data, this.message});
  factory ProductDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailResponseModelFromJson(json);
}

@JsonSerializable()
class ProductDetailModel {
  String? name;
  String? description;
  double? price;
  List<ColorModel>? color;
  List<SizeModel>? size;
  String? material;
  CareModel? care;
  @JsonKey(name: 'is_favorite')
  bool? isFavorite;
  List<CategoryModel>? categories;

  ProductDetailModel(
      {this.name,
      this.description,
      this.price,
      this.color,
      this.size,
      this.material,
      this.care,
      this.isFavorite,
      this.categories});
  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);
}

@JsonSerializable()
class ColorModel {
  int? id;
  String? name;
  List<ImageModel>? image;
  ColorModel({this.id, this.name, this.image});
  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);
}

@JsonSerializable()
class SizeModel {
  String? size;
  SizeModel({this.size});
  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);
}

@JsonSerializable()
class ImageModel {
  String? url;
  ImageModel({this.url});
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
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

  factory CareModel.fromJson(Map<String, dynamic> json) =>
      _$CareModelFromJson(json);
}

@JsonSerializable()
class CarePolicyModel {
  @JsonKey(name: 'shipping_info')
  String? shippingInfo;
  @JsonKey(name: 'COD_policy')
  String? codPolicy;
  @JsonKey(name: 'return_policy')
  String? returnPolicy;

  CarePolicyModel({this.shippingInfo, this.codPolicy, this.returnPolicy});
  factory CarePolicyModel.fromJson(Map<String, dynamic> json) =>
      _$CarePolicyModelFromJson(json);
}

@JsonSerializable()
class CategoryModel {
  final String? name;
  final String? description;
  final double? price;
  final String? image;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  CategoryModel({
    this.name,
    this.description,
    this.price,
    this.image,
    this.isFavorite,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:open_fashion/models/product_detail_response_models.dart';
part 'product_detail_layout_response_models.g.dart';

@JsonSerializable()
class ProductDetailLayoutResponseModel {
  int? code;
  String? message;
  ProductDetailLayoutModel? data;

  ProductDetailLayoutResponseModel({this.code, this.message, this.data});

  factory ProductDetailLayoutResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$ProductDetailLayoutResponseModelFromJson(json);
}

@JsonSerializable()
class ProductDetailLayoutModel {
  String? name;
  String? description;
  double? price;
  @JsonKey(name: 'ring_size')
  List<SizeModel>? ringSize;
  List<ImageModel>? gallery;
  List<ImageModel>? image;
  @JsonKey(name: 'care_policy')
  CarePolicyModel? carePolicy;
  bool? isFavorite;
  List<CategoryModel>? categories;

  ProductDetailLayoutModel({
    this.name,
    this.description,
    this.price,
    this.ringSize,
    this.gallery,
    this.image,
    this.carePolicy,
    this.isFavorite,
    this.categories,
  });

  factory ProductDetailLayoutModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailLayoutModelFromJson(json);
}

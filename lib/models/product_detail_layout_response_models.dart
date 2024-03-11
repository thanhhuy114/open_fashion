import 'package:json_annotation/json_annotation.dart';
import 'checkout_response_model.dart';
import 'product_detail_response_models.dart';
part 'product_detail_layout_response_models.g.dart';

@JsonSerializable()
class ProductDetailLayoutResponseModel {
  ProductDetailLayoutResponseModel({this.code, this.message, this.data});

  factory ProductDetailLayoutResponseModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$ProductDetailLayoutResponseModelFromJson(json);
  int? code;
  String? message;
  ProductDetailLayoutModel? data;
}

@JsonSerializable()
class ProductDetailLayoutModel {
  ProductDetailLayoutModel({
    this.productItem,
    this.ringSize,
    this.gallery,
    this.image,
    this.carePolicy,
    this.isFavorite,
    this.categories,
  });

  factory ProductDetailLayoutModel.fromJson(final Map<String, dynamic> json) =>
      _$ProductDetailLayoutModelFromJson(json);
  @JsonKey(name: 'product_item')
  ProductItem? productItem;
  @JsonKey(name: 'ring_size')
  List<SizeModel>? ringSize;
  List<ImageModel>? gallery;
  List<ImageModel>? image;
  @JsonKey(name: 'care_policy')
  CarePolicyModel? carePolicy;
  bool? isFavorite;
  List<CategoryModel>? categories;
}

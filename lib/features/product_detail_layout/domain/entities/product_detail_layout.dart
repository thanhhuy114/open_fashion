// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../complete_checkout/data/models/checkout_response_model.dart';
import '../../../product_detail/data/models/product_detail_response_models.dart';

class ProductDetailLayoutEntity extends Equatable {
  ProductDetailLayoutEntity({
    required this.productItem,
    required this.ringSize,
    required this.gallery,
    required this.image,
    required this.carePolicy,
    this.isFavorite,
    required this.categories,
  });

  @JsonKey(name: 'product_item')
  ProductItem productItem;
  @JsonKey(name: 'ring_size')
  List<SizeModel> ringSize;
  List<ImageModel> gallery;
  List<ImageModel> image;
  @JsonKey(name: 'care_policy')
  CarePolicyModel carePolicy;
  @JsonKey(name: 'is_favorite')
  bool? isFavorite;
  List<CategoryModel> categories;

  @override
  List<Object?> get props => [
        productItem,
        ringSize,
        gallery,
        image,
        carePolicy,
        isFavorite,
        categories,
      ];
}

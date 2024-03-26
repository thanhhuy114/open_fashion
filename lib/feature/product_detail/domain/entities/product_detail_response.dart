// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../models/checkout_response_model.dart';
import '../../data/models/product_detail_response_models.dart';

class ProductDetailEntity extends Equatable {
  ProductDetailEntity({
    required this.productItem,
    required this.color,
    required this.size,
    required this.material,
    required this.care,
    required this.isFavorite,
    required this.categories,
  });

  @JsonKey(name: 'product_item')
  ProductItem productItem;
  List<ColorModel> color;
  List<SizeModel> size;
  String? material;
  CareModel care;
  @JsonKey(name: 'is_favorite')
  bool? isFavorite;
  List<CategoryModel> categories;

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ColorEntity extends Equatable {
  ColorEntity({required this.id, required this.name, required this.image});

  int? id;
  String? name;
  List<ImageModel> image;
  @override
  List<Object?> get props => [id, name, image];
}

@JsonSerializable()
class SizeEntity extends Equatable {
  SizeEntity({required this.size});
  String? size;

  @override
  List<Object?> get props => [size];
}

@JsonSerializable()
class CareEntity extends Equatable {
  CareEntity({
    this.cleaning,
    this.doNotUse,
    this.doNot,
    this.dryCleanWith,
    this.ironAtMaxTemperature,
    required this.carePolicy,
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
  CarePolicyModel carePolicy;

  @override
  List<Object?> get props => [
        cleaning,
        doNotUse,
        doNot,
        dryCleanWith,
        ironAtMaxTemperature,
        carePolicy,
      ];
}

@JsonSerializable()
class CarePolicEntity extends Equatable {
  CarePolicEntity({
    required this.shippingInfo,
    required this.codPolicy,
    required this.returnPolicy,
  });

  @JsonKey(name: 'shipping_info')
  String? shippingInfo;
  @JsonKey(name: 'COD_policy')
  String? codPolicy;
  @JsonKey(name: 'return_policy')
  String? returnPolicy;

  @override
  List<Object?> get props => [shippingInfo, codPolicy, returnPolicy];
}

@JsonSerializable()
class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.isFavorite,
  });

  final String? name;
  final String? description;
  final double? price;
  final String? image;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  @override
  List<Object?> get props => [name, description, price, image, isFavorite];
}

import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Cat {
  Cat({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
  });

  factory Cat.fromJson(final Map<String, dynamic> json) => _$CatFromJson(json);
  final int? id;
  final String? name;
  final List<String?> image;
  final String? description;
  final double? price;
  final double? rating;
  Map<String, dynamic> toJson() => _$CatToJson(this);
}

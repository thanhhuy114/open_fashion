import 'package:json_annotation/json_annotation.dart';
import 'category.dart';
part 'category_data.g.dart';

@JsonSerializable()
class CategoryData {
  CategoryData({this.code, this.message, this.data});

  factory CategoryData.fromJson(final Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  final int? code;
  final String? message;
  final List<Cat>? data;

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}

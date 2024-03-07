import 'package:json_annotation/json_annotation.dart';
import 'package:open_fashion/model/category.dart';

part 'category_data.g.dart';

@JsonSerializable()
class CategoryData {
  final int? code;
  final String? message;
  final List<Cat>? data;

  CategoryData({this.code, this.message, this.data});

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}

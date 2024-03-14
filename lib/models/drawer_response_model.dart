import 'package:json_annotation/json_annotation.dart';
part 'drawer_response_model.g.dart';

@JsonSerializable()
class DrawerResponseModel {
  DrawerResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  factory DrawerResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$DrawerResponseModelFromJson(json);
  int? code;
  String? message;
  final DrawerDataModel? data;
  Map<String, dynamic> toJson() => _$DrawerResponseModelToJson(this);
}

@JsonSerializable()
class DrawerDataModel {
  DrawerDataModel({
    required this.drawer,
  });
  factory DrawerDataModel.fromJson(final Map<String, dynamic> json) =>
      _$DrawerDataModelFromJson(json);
  final List<DrawerModel> drawer;
  Map<String, dynamic> toJson() => _$DrawerDataModelToJson(this);
}

@JsonSerializable()
class DrawerModel {
  DrawerModel({
    required this.type,
    required this.items,
  });
  factory DrawerModel.fromJson(final Map<String, dynamic> json) =>
      _$DrawerModelFromJson(json);
  String type;
  final List<ItemsDataModel> items;
  Map<String, dynamic> toJson() => _$DrawerModelToJson(this);
}

@JsonSerializable()
class ItemsDataModel {
  ItemsDataModel({
    required this.name,
    required this.items,
  });
  factory ItemsDataModel.fromJson(final Map<String, dynamic> json) =>
      _$ItemsDataModelFromJson(json);
  String name;
  final List<ItemsDrawerModel> items;
  Map<String, dynamic> toJson() => _$ItemsDataModelToJson(this);
}

@JsonSerializable()
class ItemsDrawerModel {
  ItemsDrawerModel({
    required this.item,
  });
  factory ItemsDrawerModel.fromJson(final Map<String, dynamic> json) =>
      _$ItemsDrawerModelFromJson(json);
  String item;
  Map<String, dynamic> toJson() => _$ItemsDrawerModelToJson(this);
}

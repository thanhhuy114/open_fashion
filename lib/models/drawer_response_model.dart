import 'package:json_annotation/json_annotation.dart';
part 'drawer_response_model.g.dart';
@JsonSerializable()
class DrawerResponseModel{
  DrawerResponseModel({
    this.code,
    this.message,
    required this.data
  });
  int? code;
  String? message;
  final DrawerDataModel? data;
  factory DrawerResponseModel.fromJson(Map<String, dynamic> json) => _$DrawerResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$DrawerResponseModelToJson(this);
}

@JsonSerializable()
class DrawerDataModel{
  DrawerDataModel({
    required this.drawer,
  });
  final List<DrawerModel> drawer;
  factory DrawerDataModel.fromJson(Map<String, dynamic> json) => _$DrawerDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DrawerDataModelToJson(this);
}

@JsonSerializable()
class DrawerModel{
  DrawerModel({
    required this.type,
    required this.items
  });
  String type;
  final List<ItemsDataModel> items;
  factory DrawerModel.fromJson(Map<String, dynamic> json) => _$DrawerModelFromJson(json);
  Map<String, dynamic> toJson() => _$DrawerModelToJson(this);
}

@JsonSerializable()
class ItemsDataModel{
  ItemsDataModel({
    required this.name,
    required this.items
  });
  String name;
  final List<ItemsDrawerModel> items;
  factory ItemsDataModel.fromJson(Map<String, dynamic> json) => _$ItemsDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsDataModelToJson(this);
}

@JsonSerializable()
class ItemsDrawerModel{
  ItemsDrawerModel({
    required this.item
  });
  String item;
  factory ItemsDrawerModel.fromJson(Map<String, dynamic> json) => _$ItemsDrawerModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsDrawerModelToJson(this);
}
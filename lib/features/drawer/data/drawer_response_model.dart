import 'package:json_annotation/json_annotation.dart';

import '../domain/drawer.dart';
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
class DrawerModel extends DrawerEntity {
  DrawerModel({
    required this.type,
    required this.items,
  });
  factory DrawerModel.fromJson(final Map<String, dynamic> json) =>
      _$DrawerModelFromJson(json);
  @override
  String type;
  @override
  List<ItemsDataModel> items;
  Map<String, dynamic> toJson() => _$DrawerModelToJson(this);
}

@JsonSerializable()
class ItemsDataModel extends ItemsDataEntity{
  ItemsDataModel({
    required this.name,
    required this.items,
  });
  factory ItemsDataModel.fromJson(final Map<String, dynamic> json) =>
      _$ItemsDataModelFromJson(json);
  @override
  String name;
  @override
  List<ItemsDrawerModel> items;
  Map<String, dynamic> toJson() => _$ItemsDataModelToJson(this);
}

@JsonSerializable()
class ItemsDrawerModel extends ItemsDrawerEntity {
  ItemsDrawerModel({
    required this.item,
  });
  factory ItemsDrawerModel.fromJson(final Map<String, dynamic> json) =>
      _$ItemsDrawerModelFromJson(json);
  @override
  String item;
  Map<String, dynamic> toJson() => _$ItemsDrawerModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/arrival.dart';
part 'menu_arrival_response_model.g.dart';

@JsonSerializable()
class MenuArrivalResponseModel {
  MenuArrivalResponseModel({
    this.code,
    this.message,
    this.data,
  });
  factory MenuArrivalResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$MenuArrivalResponseModelFromJson(json);
  int? code;
  String? message;
  final MenuArrivalModel? data;
  Map<String, dynamic> toJson() => _$MenuArrivalResponseModelToJson(this);
}

@JsonSerializable()
class MenuArrivalModel {
  MenuArrivalModel({
    required this.arrival,
    required this.justforyou,
    required this.followus,
  });
  factory MenuArrivalModel.fromJson(final Map<String, dynamic> json) =>
      _$MenuArrivalModelFromJson(json);
  final List<ArrivalModel> arrival;
  final List<JustForYouModel> justforyou;
  final List<FollowUsModel> followus;
  Map<String, dynamic> toJson() => _$MenuArrivalModelToJson(this);
}

@JsonSerializable()
class ArrivalModel extends ArrivalEntity {
  const ArrivalModel({
    required this.name,
    required this.items,
  });
  factory ArrivalModel.fromJson(final Map<String, dynamic> json) =>
      _$ArrivalModelFromJson(json);
  @override
  final String name;
  @override
  final List<ItemsModel> items;
  Map<String, dynamic> toJson() => _$ArrivalModelToJson(this);
}

@JsonSerializable()
class ItemsModel extends ItemsEntity {
  const ItemsModel({
    required this.image,
    required this.content,
    required this.price,
  });
  factory ItemsModel.fromJson(final Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);
  @override
  final String image;
  @override
  final String content;
  @override
  final int price;
  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);
}

@JsonSerializable()
class JustForYouModel extends JustForYouEntity {
  JustForYouModel({
    required this.image,
    required this.content,
    required this.price,
  });
  factory JustForYouModel.fromJson(final Map<String, dynamic> json) =>
      _$JustForYouModelFromJson(json);
  @override
  String image;
  @override
  String content;
  @override
  int price;
  Map<String, dynamic> toJson() => _$JustForYouModelToJson(this);
}

@JsonSerializable()
class FollowUsModel extends FollowUsEntity {
  FollowUsModel({
    required this.image,
    required this.tag,
  });
  factory FollowUsModel.fromJson(final Map<String, dynamic> json) =>
      _$FollowUsModelFromJson(json);
  @override
  String image;
  @override
  String tag;
  Map<String, dynamic> toJson() => _$FollowUsModelToJson(this);
}

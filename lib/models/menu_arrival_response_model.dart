import 'package:json_annotation/json_annotation.dart';
part 'menu_arrival_response_model.g.dart';
@JsonSerializable()
class MenuArrivalResponseModel{
  MenuArrivalResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  factory MenuArrivalResponseModel.fromJson(final Map<String,dynamic> json) => _$MenuArrivalResponseModelFromJson(json);
  int? code;
  String? message;
  final MenuArrivalModel? data;
  Map<String, dynamic> toJson() => _$MenuArrivalResponseModelToJson(this);
}

@JsonSerializable()
class MenuArrivalModel{
  MenuArrivalModel({
    required this.arrival,
    required this.justforyou,
    required this.followus
  });
  factory MenuArrivalModel.fromJson(final Map<String,dynamic> json) => _$MenuArrivalModelFromJson(json);
  final List<ArrivalModel> arrival;
  final List<JustForYouModel> justforyou;
  final List<FollowUsModel> followus;
  Map<String, dynamic> toJson() => _$MenuArrivalModelToJson(this);
}

@JsonSerializable()
class ArrivalModel{
  ArrivalModel({
    required this.name,
    required this.items,
  });
  factory ArrivalModel.fromJson(final Map<String,dynamic> json) => _$ArrivalModelFromJson(json);
  final String name;
  final List<ItemsModel> items;
  Map<String, dynamic> toJson() => _$ArrivalModelToJson(this);
}

@JsonSerializable()
class ItemsModel{
  ItemsModel({
    required this.image,
    required this.content,
    required this.price,
  });
  factory ItemsModel.fromJson(final Map<String,dynamic> json) => _$ItemsModelFromJson(json);
  final String image;
  final String content;
  final int price;
  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);
}

@JsonSerializable()
class JustForYouModel{
  JustForYouModel({
    required this.image,
    required this.content,
    required this.price,
  });
  String image;
  String content;
  int price;
  factory JustForYouModel.fromJson(final Map<String,dynamic> json) => _$JustForYouModelFromJson(json);
  Map<String, dynamic> toJson() => _$JustForYouModelToJson(this);
}

@JsonSerializable()
class FollowUsModel{
  FollowUsModel({
    required this.image,
    required this.tag,
  });
  String image;
  String tag;
  factory FollowUsModel.fromJson(final Map<String,dynamic> json) => _$FollowUsModelFromJson(json);
  Map<String, dynamic> toJson() => _$FollowUsModelToJson(this);
}
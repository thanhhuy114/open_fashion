import 'package:json_annotation/json_annotation.dart';
part 'recent_search_response_model.g.dart';

@JsonSerializable()
class RecentSearchResponseModel {
  RecentSearchResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory RecentSearchResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$RecentSearchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecentSearchResponseModelToJson(this);

  final int? code;
  final String? message;
  final RecentSearchModel? data;
}

@JsonSerializable()
class RecentSearchModel {
  RecentSearchModel({required this.recentSearch});


  factory RecentSearchModel.fromJson(final Map<String, dynamic> json) =>
      _$RecentSearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecentSearchModelToJson(this);

  @JsonKey(name: 'recent_search')
  final List<RecentSearchItemModel> recentSearch;
}

@JsonSerializable()
class RecentSearchItemModel {
  RecentSearchItemModel({required this.id, required this.text});

  factory RecentSearchItemModel.fromJson(final Map<String, dynamic> json) =>
      _$RecentSearchItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecentSearchItemModelToJson(this);

  final int? id;
  final String? text;
}

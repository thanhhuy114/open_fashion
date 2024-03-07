import 'package:json_annotation/json_annotation.dart';
part 'post_menu_response_model.g.dart';

@JsonSerializable()
class PostMenuResponseModel {
  PostMenuResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory PostMenuResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$PostMenuResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostMenuResponseModelToJson(this);

  final int? code;
  final String? message;
  final PostMenuModel? data;
}

@JsonSerializable()
class PostMenuModel {
  PostMenuModel({required this.postSummaru});

  factory PostMenuModel.fromJson(final Map<String, dynamic> json) =>
      _$PostMenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostMenuModelToJson(this);

  @JsonKey(name: 'posts')
  final List<PostSummaryModel> postSummaru;
}

@JsonSerializable()
class PostSummaryModel {
  PostSummaryModel({
    required this.description,
    required this.imageUrlTypeGird,
    required this.tittle,
    required this.datePublished,
    required this.imageUrl,
    required this.tags,
  });

  factory PostSummaryModel.fromJson(final Map<String, dynamic> json) =>
      _$PostSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostSummaryModelToJson(this);

  @JsonKey(name: 'title')
  final String tittle;

  final String description;

  @JsonKey(name: 'image_url_type_gird')
  final String imageUrlTypeGird;

  @JsonKey(name: 'date_published')
  final String datePublished;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  final List<String> tags;
}

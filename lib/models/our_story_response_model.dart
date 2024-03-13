import 'package:json_annotation/json_annotation.dart';
import 'product_detail_response_models.dart';
part 'our_story_response_model.g.dart';

@JsonSerializable()
class OurStoryResponseModel {
  OurStoryResponseModel({this.code, this.message, this.data});
  factory OurStoryResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$OurStoryResponseModelFromJson(json);
  int? code;
  String? message;
  OurStoryModel? data;
}

@JsonSerializable()
class OurStoryModel {
  OurStoryModel({required this.ourStory});
  factory OurStoryModel.fromJson(final Map<String, dynamic> json) =>
      _$OurStoryModelFromJson(json);
  @JsonKey(name: 'our_story')
  OurStoryInfoModel ourStory;
}

@JsonSerializable()
class OurStoryInfoModel {
  OurStoryInfoModel({
   required this.openMessage,
   required this.createMessage,
   required this.images,
   required this.signUp,
  });
  factory OurStoryInfoModel.fromJson(final Map<String, dynamic> json) =>
      _$OurStoryInfoModelFromJson(json);
 
  @JsonKey(name: 'open_message')
  String openMessage;
  @JsonKey(name: 'create_message')
  String createMessage;
  ImageModel images;
  @JsonKey(name: 'sign_up')
  String signUp;
}

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../product_detail/data/models/product_detail_response_models.dart';
import '../../domain/entities/our_story.dart';
part 'our_story_response_model.g.dart';

@JsonSerializable()
class OurStoryResponseModel extends Equatable {
  OurStoryResponseModel({this.code, this.message, this.data});
  factory OurStoryResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$OurStoryResponseModelFromJson(json);
  int? code;
  String? message;
  OurStoryModel? data;

  @override
  List<Object?> get props => [code, message, data];
}

@JsonSerializable()
class OurStoryModel extends OurStoryEntity {
  OurStoryModel(
    final String? openMessage,
    final String? createMessage,
    final ImageModel? images,
    final String? signUp,
  ) : super(
          openMessage: openMessage,
          createMessage: createMessage,
          images: images,
          signUp: signUp,
        );

  factory OurStoryModel.fromJson(final Map<String, dynamic> json) =>
      _$OurStoryModelFromJson(json);
}

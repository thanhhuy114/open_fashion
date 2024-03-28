// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../product_detail/data/models/product_detail_response_models.dart';


class OurStoryEntity extends Equatable {
  OurStoryEntity({
    this.openMessage,
    this.createMessage,
    this.images,
    this.signUp,
  });

  @JsonKey(name: 'open_message')
  String? openMessage;
  @JsonKey(name: 'create_message')
  String? createMessage;
  ImageModel? images;
  @JsonKey(name: 'sign_up')
  String? signUp;
  @override
  List<Object?> get props => [openMessage, createMessage, images, signUp];
}

class ImageEntity extends Equatable {
  ImageEntity({this.url});
  String? url;
  @override
  List<Object?> get props => [url];
}

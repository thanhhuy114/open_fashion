import 'package:json_annotation/json_annotation.dart';

import '../domain/contact_us.dart';

part 'contact_us_response_model.g.dart';

@JsonSerializable()
class ContactUsResponseModel {
  ContactUsResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  factory ContactUsResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$ContactUsResponseModelFromJson(json);
  int? code;
  String? message;
  final ContactUsModel data;
  Map<String, dynamic> toJson() => _$ContactUsResponseModelToJson(this);
}

@JsonSerializable()
class ContactUsModel extends ContactUsEntity {
  ContactUsModel({
    this.chat,
    this.text,
    this.email,
  });
  factory ContactUsModel.fromJson(final Map<String, dynamic> json) =>
      _$ContactUsModelFromJson(json);
  @override
  String? chat;
  @override
  String? text;
  @override
  final EmailModel? email;
  Map<String, dynamic> toJson() => _$ContactUsModelToJson(this);
}

@JsonSerializable()
class EmailModel extends EmailEntity {
  EmailModel({
    this.facebook,
    this.twitter,
    this.end,
  });
  factory EmailModel.fromJson(final Map<String, dynamic> json) =>
      _$EmailModelFromJson(json);
  @override
  String? facebook;
  @override
  String? twitter;
  @override
  String? end;
  Map<String, dynamic> toJson() => _$EmailModelToJson(this);
}

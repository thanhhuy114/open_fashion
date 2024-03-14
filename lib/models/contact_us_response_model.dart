import 'package:json_annotation/json_annotation.dart';

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
class ContactUsModel {
  ContactUsModel({
    required this.chat,
    required this.text,
    required this.email,
  });
  factory ContactUsModel.fromJson(final Map<String, dynamic> json) =>
      _$ContactUsModelFromJson(json);
  String chat;
  String text;
  final EmailModel email;
  Map<String, dynamic> toJson() => _$ContactUsModelToJson(this);
}

@JsonSerializable()
class EmailModel {
  EmailModel({
    required this.facebook,
    required this.twitter,
    required this.end,
  });
  factory EmailModel.fromJson(final Map<String, dynamic> json) =>
      _$EmailModelFromJson(json);
  String facebook;
  String twitter;
  String end;
  Map<String, dynamic> toJson() => _$EmailModelToJson(this);
}

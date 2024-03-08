import 'package:json_annotation/json_annotation.dart';

part 'contact_us_response_model.g.dart';
@JsonSerializable()
class ContactUsResponseModel{
  ContactUsResponseModel({
    this.code,
    this.message,
    required this.data
  });
  int? code;
  String? message;
  final ContactUsModel data;
  factory ContactUsResponseModel.fromJson(Map<String, dynamic> json) => _$ContactUsResponseModelFromJson(json);
  Map<String,dynamic> toJson() => _$ContactUsResponseModelToJson(this);
}
@JsonSerializable()
class ContactUsModel{
  ContactUsModel({
    required this.chat,
    required this.text,
    required this.email
  });
  String chat;
  String text;
  final EmailModel email;
  factory ContactUsModel.fromJson(Map<String, dynamic> json) => _$ContactUsModelFromJson(json);
  Map<String,dynamic> toJson() => _$ContactUsModelToJson(this);
}

@JsonSerializable()
class EmailModel{
  EmailModel({
    required this.facebook,
    required this.twitter,
    required this.end
  });
  String facebook;
  String twitter;
  String end;
  factory EmailModel.fromJson(Map<String, dynamic> json) => _$EmailModelFromJson(json);
  Map<String,dynamic> toJson() => _$EmailModelToJson(this);
}
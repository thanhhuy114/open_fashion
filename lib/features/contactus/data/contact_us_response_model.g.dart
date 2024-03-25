// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsResponseModel _$ContactUsResponseModelFromJson(
        Map<String, dynamic> json) =>
    ContactUsResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: ContactUsModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactUsResponseModelToJson(
        ContactUsResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ContactUsModel _$ContactUsModelFromJson(Map<String, dynamic> json) =>
    ContactUsModel(
      chat: json['chat'] as String,
      text: json['text'] as String,
      email: EmailModel.fromJson(json['email'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactUsModelToJson(ContactUsModel instance) =>
    <String, dynamic>{
      'chat': instance.chat,
      'text': instance.text,
      'email': instance.email,
    };

EmailModel _$EmailModelFromJson(Map<String, dynamic> json) => EmailModel(
      facebook: json['facebook'] as String,
      twitter: json['twitter'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$EmailModelToJson(EmailModel instance) =>
    <String, dynamic>{
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'end': instance.end,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FooterResponseModel _$FooterResponseModelFromJson(Map<String, dynamic> json) =>
    FooterResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : FooterModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FooterResponseModelToJson(
        FooterResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

FooterModel _$FooterModelFromJson(Map<String, dynamic> json) => FooterModel(
      gmail: json['gmail'] as String,
      phone: json['phone'] as String,
      openTime: json['open_time'] as String,
      closeTime: json['close_time'] as String,
      daysPerWeek: json['days_per_week'] as String,
    );

Map<String, dynamic> _$FooterModelToJson(FooterModel instance) =>
    <String, dynamic>{
      'gmail': instance.gmail,
      'phone': instance.phone,
      'open_time': instance.openTime,
      'close_time': instance.closeTime,
      'days_per_week': instance.daysPerWeek,
    };

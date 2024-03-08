// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardResponseModel _$CardResponseModelFromJson(Map<String, dynamic> json) =>
    CardResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardResponseModelToJson(CardResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      nameOnCard: json['name_on_card'] as String?,
      cardNumber: json['card_number'] as String?,
      expMonth: json['exp_month'] as int?,
      expDate: json['exp_date'] as int?,
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'name_on_card': instance.nameOnCard,
      'card_number': instance.cardNumber,
      'exp_month': instance.expMonth,
      'exp_date': instance.expDate,
    };

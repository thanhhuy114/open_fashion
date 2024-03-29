import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_response_model.g.dart';

@JsonSerializable()
class CardResponseModel extends Equatable {
  const CardResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory CardResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$CardResponseModelFromJson(json);

  final int? code;
  static const String codeKey = 'code';

  final String? message;
  static const String messageKey = 'message';

  final List<CardModel>? data;
  static const String dataKey = 'data';

  Map<String, dynamic> toJson() => _$CardResponseModelToJson(this);

  @override
  String toString() {
    return '$code, $message, $data, ';
  }

  @override
  List<Object?> get props => [
        code,
        message,
        data,
      ];
}

@JsonSerializable()
class CardModel extends Equatable {
  const CardModel({
    required this.nameOnCard,
    required this.cardNumber,
    required this.expMonth,
    required this.expDate,
  });

  factory CardModel.fromJson(final Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  @JsonKey(name: 'name_on_card')
  final String? nameOnCard;
  static const String nameOnCardKey = 'name_on_card';

  @JsonKey(name: 'card_number')
  final String? cardNumber;
  static const String cardNumberKey = 'card_number';

  @JsonKey(name: 'exp_month')
  final int? expMonth;
  static const String expMonthKey = 'exp_month';

  @JsonKey(name: 'exp_date')
  final int? expDate;
  static const String expDateKey = 'exp_date';

  Map<String, dynamic> toJson() => _$CardModelToJson(this);

  @override
  String toString() {
    return '$nameOnCard, $cardNumber, $expMonth, $expDate, ';
  }

  @override
  List<Object?> get props => [
        nameOnCard,
        cardNumber,
        expMonth,
        expDate,
      ];
}

/*
{
	"code": 1,
	"message": "success",
	"data": [
		{
			"name_on_card": "Iris Watson",
			"card_number": "2365 3654 2365 3698",
			"exp_month": 3,
			"exp_date": 25
		},
		{
			"name_on_card": "Iris Watson",
			"card_number": "2365 3654 2365 3698",
			"exp_month": 3,
			"exp_date": 25
		},
		{
			"name_on_card": "Iris Watson",
			"card_number": "2365 3654 2365 3698",
			"exp_month": 3,
			"exp_date": 25
		}
	]
}*/

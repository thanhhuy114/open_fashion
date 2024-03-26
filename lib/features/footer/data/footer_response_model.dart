import 'package:json_annotation/json_annotation.dart';

import '../domain/footer.dart';
part 'footer_response_model.g.dart';

@JsonSerializable()
class FooterResponseModel {
  FooterResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  factory FooterResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$FooterResponseModelFromJson(json);
  int? code;
  String? message;
  final FooterModel? data;
  Map<String, dynamic> toJson() => _$FooterResponseModelToJson(this);
}

@JsonSerializable()
class FooterModel extends FooterEntity{
  FooterModel({
    required this.gmail,
    required this.phone,
    required this.openTime,
    required this.closeTime,
    required this.daysPerWeek,
  });
  factory FooterModel.fromJson(final Map<String, dynamic> json) =>
      _$FooterModelFromJson(json);
  @override
  String gmail;
  @override
  String phone;
  @override
  @JsonKey(name: 'open_time')
  String openTime;
  @override
  @JsonKey(name: 'close_time')
  String closeTime;
  @override
  @JsonKey(name: 'days_per_week')
  String daysPerWeek;
  Map<String, dynamic> toJson() => _$FooterModelToJson(this);
}

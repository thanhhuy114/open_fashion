import 'package:json_annotation/json_annotation.dart';
part 'footer_response_model.g.dart';
@JsonSerializable()
class FooterResponseModel{
  FooterResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  factory FooterResponseModel.fromJson(final Map<String, dynamic> json) => _$FooterResponseModelFromJson(json);
  int? code;
  String? message;
  final FooterModel? data;
  Map<String, dynamic> toJson() => _$FooterResponseModelToJson(this);
}
@JsonSerializable()
class FooterModel{
  FooterModel({
    required this.gmail,
    required this.phone,
    required this.openTime,
    required this.closeTime,
    required this.daysPerWeek,
  });
  factory FooterModel.fromJson(final Map<String, dynamic> json) => _$FooterModelFromJson(json);
  String gmail;
  String phone;
  @JsonKey(name: 'open_time')
  String openTime;
  @JsonKey(name: 'close_time')
  String closeTime;
  @JsonKey(name: 'days_per_week')
  String daysPerWeek;
  Map<String, dynamic> toJson() => _$FooterModelToJson(this);
}
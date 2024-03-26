import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class FooterEntity extends Equatable{
  const FooterEntity({
    this.gmail,
    this.phone,
    this.openTime,
    this.closeTime,
    this.daysPerWeek,
  });
  final String? gmail;
  final String? phone;
  @JsonKey(name: 'open_time')
  final String? openTime;
  @JsonKey(name: 'close_time')
  final String? closeTime;
  @JsonKey(name: 'days_per_week')
  final String? daysPerWeek;

  @override
  List<Object?> get props{
    return [gmail,phone,openTime,closeTime,daysPerWeek];
  }
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyDetails _$CurrencyFromJson(Map<String, dynamic> json) {
  return CurrencyDetails(
    name: json['name'] as String,
    namePlural:  json['name_plural'] as String,
    isoCode2:  json['iso_code2'] as String,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$CurrencyToJson(CurrencyDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'name_plural': instance.namePlural,
      'iso_code2': instance.isoCode2,
      'code': instance.code,
    };

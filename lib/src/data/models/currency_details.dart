import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_details.g.dart';

// const List<Map<String, String>> currenciesList = [
// {
// "flag_url" : "//upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Flag_of_Australia.svg/22px-Flag_of_Australia.svg.png",
// "name_ru" : "Австралия",
// "iso_code2" : "AU",
// "iso_code3" : "AUS"
// },

@JsonSerializable(nullable: false)
class CurrencyDetails extends Equatable {
  final String name;
  final String namePlural;
  final String isoCode2;
  final String code;
  final String flagUrl;

  const CurrencyDetails({
    @required this.name,
    @required this.namePlural,
    @required this.isoCode2,
    @required this.code,
      this.flagUrl,
  });

  factory CurrencyDetails.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  @override
  List<Object> get props => [name, namePlural, isoCode2, code, flagUrl];
}
// https://www.localeplanet.com/api/auto/currencymap.json

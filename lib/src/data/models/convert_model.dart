import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'convert_model_details.dart';

// {
// "base_currency_code":"AUD"
// "base_currency_name":"Australian dollar"
// "amount":"1.0000"
// "updated_date":"2021-03-28"
// "rates":{
// "CAD":{
// "currency_name":"Canadian dollar"
// "rate":"0.9577"
// "rate_for_amount":"0.9577"
// }
//
//
// }
// "status":"success"
// }

class ConvertModel extends Equatable {
  final String baseCurrencyCode;
  final String baseCurrencyName;
  final String amount;
  final String updatedDate;
  final Map<String, ConvertModelDetails> rates;

  const ConvertModel({
    @required this.baseCurrencyCode,
    @required this.baseCurrencyName,
    @required this.amount,
    @required this.updatedDate,
    @required this.rates,
  });

  factory ConvertModel.fromJson(Map<String, dynamic> json) => ConvertModel(
        baseCurrencyCode: json['base_currency_code'],
        baseCurrencyName: json['base_currency_name'],
        amount: json['amount'],
        updatedDate: json['updated_date'],
        rates: Map.from(json['rates']).map(
          (key, value) => MapEntry<String, ConvertModelDetails>(
            key,
            ConvertModelDetails.fromJson(value),
          ),
        ),
      );

  @override
  // TODO: implement props
  List<Object> get props =>
      [baseCurrencyCode, baseCurrencyName, amount, updatedDate, rates];
}

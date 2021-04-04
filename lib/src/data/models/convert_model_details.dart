import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// "currency_name":"Canadian dollar"
// "rate":"0.9577"
// "rate_for_amount":"0.9577"

class ConvertModelDetails extends Equatable {
  final String currencyName;
  final String rate;
  final String rateForAmount;

  const ConvertModelDetails({
    @required this.currencyName,
    @required this.rate,
    @required this.rateForAmount,
  });

  factory ConvertModelDetails.fromJson(Map<String, dynamic> json) =>
      ConvertModelDetails(
          currencyName: json['currency_name'],
          rate: json['rate'],
          rateForAmount: json['rate_for_amount']);

  @override
  // TODO: implement props
  List<Object> get props => [currencyName, rate, rateForAmount];
}

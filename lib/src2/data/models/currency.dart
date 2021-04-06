import 'package:equatable/equatable.dart';
import 'package:news_currency_converter_bloc/src/data/models/currency_details.dart';

class Currency extends Equatable {
  final Map<String, CurrencyDetails> currencies;

  Currency({this.currencies});

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        currencies: Map.from(json['Currencies']).map(
          (key, value) => MapEntry<String, CurrencyDetails>(
            key,
            CurrencyDetails.fromJson(value),
          ),
        ),
      );

  @override
  List<Object> get props {
    return [currencies];
  }
}

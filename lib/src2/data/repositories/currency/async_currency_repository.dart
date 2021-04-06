import 'package:news_currency_converter_bloc/src/api/coin_data.dart';
import 'package:news_currency_converter_bloc/src/api/currency_data.dart';
import 'package:news_currency_converter_bloc/src/data/data_providers/fetch_data.dart';
import 'package:news_currency_converter_bloc/src/data/data_providers/fetch_data_from_networks.dart';
import 'package:news_currency_converter_bloc/src/data/models/convert_model.dart';
import 'package:news_currency_converter_bloc/src/data/models/convert_model_details.dart';
import 'package:news_currency_converter_bloc/src/data/models/currency.dart';
import 'package:news_currency_converter_bloc/src/data/models/currency_details.dart';
import 'package:news_currency_converter_bloc/src/data/repositories/currency/currency_perository.dart';

class AsyncCurrencyRepository extends CurrencyRepository {
  FetchData fetchDataFromNetworks = FetchDataFromNetworks();
  ConvertModel convertModel;

  @override
  Future<Iterable<CurrencyDetails>> fetchCurrencyDetails() async {
    final currencyList = <CurrencyDetails>[];

    Map<String, dynamic> currencies = currenciesList_2[0];

    final dto = Currency.fromJson(currencies);

    dto.currencies.forEach((key, value) {
      currencyList.add(CurrencyDetails(
          name: value.name,
          namePlural: value.namePlural,
          isoCode2: value.isoCode2,
          code: value.code));
    });
    return currencyList;
  }

  @override
  Future<Iterable<ConvertModelDetails>> convertCurrency(
      {String from, String to, int amount}) async {
    final convertConvertModelDetailsList = <ConvertModelDetails>[];
    var response = await fetchDataFromNetworks.getDataConvertCurrency(
        from: from, to: to, amount: amount);

    ConvertModel.fromJson(response).rates.forEach((key, value) {
      convertConvertModelDetailsList.add(
        ConvertModelDetails(
          rateForAmount: value.rateForAmount,
          rate: value.rate,
          currencyName: value.currencyName,
        ),
      );
    });
    return convertConvertModelDetailsList;
  }


}

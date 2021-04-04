
import 'package:news_currency_converter_bloc/src/data/models/currency_details.dart';
import 'package:news_currency_converter_bloc/src/data/models/convert_model_details.dart';

abstract class CurrencyRepository{

  Future<Iterable<CurrencyDetails>> fetchCurrencyDetails();

  Future<Iterable<ConvertModelDetails>> convertCurrency({String from, String to, int amount});
}
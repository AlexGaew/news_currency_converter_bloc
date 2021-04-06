import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:news_currency_converter_bloc/src/data/data_providers/fetch_data.dart';



class FetchDataFromNetworks extends FetchData {
  final client = http.Client();

  static const _apiRapidapiCurrencyKey =
      'b762f49b0amsh1062037a41368bfp131390jsn00194ccd09e2';
  static const Map<String, String> _headersRapidapi = const {
    'x-rapidapi-key': _apiRapidapiCurrencyKey,
  };
  static const _apiNewsKey = 'aaddf11935d14616825edde47b7b09f7';
  static const Map<String, String> _headersNewsApi = const {
    'X-Api-Key': _apiNewsKey,
  };

  @override
  Future getDataConvertCurrency({String from, String to, int amount}) async {
    const url = 'https://currency-converter5.p.rapidapi.com/';
    try {
      http.Response response = await http.get(
          '$url'
          'currency/convert?format=json&from=$from&to=$to&amount=$amount',
          headers: _headersRapidapi);

      if (response.statusCode == 200) {
        String data = response.body;
        return convert.jsonDecode(data);
      } else {
        throw HttpException(
            'Request failed with status:getDataConvertCurrency ${response.statusCode}');
      }
    } finally {
      client.close();
    }
  }

  @override
  Future getTopHeadlinesNews({String country}) async {
    //final url = 'https://newsapi.org/v2/';

    try {
      http.Response response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=ru&apiKey=$_apiNewsKey',
          headers: _headersNewsApi);

      if (response.statusCode == 200) {
        String data = response.body;
        return convert.jsonDecode(data);
      } else {
        throw HttpException(
            'Request failed with status: getTopHeadlinesNews ${response.statusCode}');
      }
    } finally {
      client.close();
    }
  }
}

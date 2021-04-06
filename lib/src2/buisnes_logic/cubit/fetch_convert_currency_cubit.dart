import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_currency_converter_bloc/src/data/models/convert_model_details.dart';
import 'package:news_currency_converter_bloc/src/data/repositories/currency/async_currency_repository.dart';
import 'package:news_currency_converter_bloc/src/data/repositories/currency/currency_perository.dart';

part 'fetch_convert_currency_state.dart';

class FetchConvertCurrencyCubit extends Cubit<FetchConvertCurrencyInitial> {
  CurrencyRepository asyncRepository = AsyncCurrencyRepository();

  FetchConvertCurrencyCubit()
      : super(
          FetchConvertCurrencyInitial(
              convertModelDetails: <ConvertModelDetails>[
                ConvertModelDetails(
                  currencyName: '',
                  rate: '',
                  rateForAmount: '',
                )
              ]),
        );

  // int setAmount(String amount){
  //   _amount = int.parse(amount);
  //   return _amount;
  // }

  void getConvertCurrency({to, from, amount}) async {
    List<ConvertModelDetails> currency = await asyncRepository
        .convertCurrency(amount: amount, to: to, from: from)
        .then<Iterable<ConvertModelDetails>>((value) => value );


    if (currency != null) {
      emit(FetchConvertCurrencyInitial(convertModelDetails: currency));
    }
  }
}

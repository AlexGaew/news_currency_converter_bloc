import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_currency_converter_bloc/src/data/models/currency_details.dart';
import 'package:news_currency_converter_bloc/src/data/repositories/currency/async_currency_repository.dart';
part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  AsyncCurrencyRepository asyncCurrencyRepository;

  CurrencyBloc({  this.asyncCurrencyRepository})
      : assert(asyncCurrencyRepository != null),
        super(CurrencyStateInitial());

  @override
  Stream<CurrencyState> mapEventToState(CurrencyEvent event) async* {
    try {
      if (event is CurrencyEventRequested) {
        yield CurrencyStateLoading();

        final List<CurrencyDetails> currency =
            await asyncCurrencyRepository.fetchCurrencyDetails();

        yield CurrencyStateSuccess(listCurrency: currency);
      }

      if (event is CurrencyStateInitial) {
        final currency =
            await asyncCurrencyRepository.fetchCurrencyDetails();

        yield CurrencyStateSuccess(listCurrency: currency);
      }
    } catch (exception) {
      yield CurrencyStateFailure();
    }
  }
}
// class CurrencyBloc extends Bloc<CurrencyEvent, List<Currency>> {
//   AsyncCurrencyRepository asyncCurrencyRepository;
//
//   CurrencyBloc({  this.asyncCurrencyRepository})
//       : assert(asyncCurrencyRepository != null),
//         super(<Currency>[]);
//
//   @override
//   Stream<List<Currency>> mapEventToState(CurrencyEvent event) async* {
//     try {
//       if (event is CurrencyEventRequested) {
//
//
//         final List<Currency> currency =
//         await asyncCurrencyRepository.fetchCurrencyDetails();
//
//         yield currency;
//       }
//
//       if (event is CurrencyStateInitial) {
//         final currency =
//         await asyncCurrencyRepository.fetchCurrencyDetails();
//
//         yield currency;
//       }
//     } catch (exception) {
//       yield null;
//     }
//   }
// }
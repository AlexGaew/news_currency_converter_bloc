import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news_currency_converter_bloc/src/data/models/convert_model_details.dart';
import 'package:news_currency_converter_bloc/src/data/repositories/currency/async_currency_repository.dart';
import 'package:news_currency_converter_bloc/src/data/repositories/currency/currency_perository.dart';

part 'convert_event.dart';

part 'convert_state.dart';

class ConvertBloc extends Bloc<ConvertEvent, ConvertState> {
  CurrencyRepository currencyRepository = AsyncCurrencyRepository();

  ConvertBloc({ConvertStateLoading initialState}) : super(initialState);



  @override
  Stream<ConvertState> mapEventToState(ConvertEvent event) async* {
    if (state is ConvertEvent) {
      yield ConvertStateLoading();
      // try {
      //   final convert = await currencyRepository.convertCurrency(
      //       amount: event.amount, to: event.to, from: event.from);
      //   yield convert;
      // } catch (_) {
      //   yield CurrencyStateFailure();
      // }
    }

  }
}

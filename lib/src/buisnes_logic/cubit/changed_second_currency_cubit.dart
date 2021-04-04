import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_currency_converter_bloc/src/data/models/currency_details.dart';

part 'changed_second_currency_state.dart';

class ChangedSecondCurrencyCubit extends Cubit<ChangedSecondCurrencyInitial> {
  ChangedSecondCurrencyCubit()
      : super(ChangedSecondCurrencyInitial(
          currency: CurrencyDetails(
            name: "Азербайджан",
            code: "AZN",
            isoCode2:  "AZ",
            namePlural:  '',
           flagUrl: "'https://flagcdn.com/120x90/az.webp'",
          ),
        ));

  void setSecondCurrency(CurrencyDetails currency) {
    if (currency != null) {
      emit(ChangedSecondCurrencyInitial(currency: currency));
    }
  }
}

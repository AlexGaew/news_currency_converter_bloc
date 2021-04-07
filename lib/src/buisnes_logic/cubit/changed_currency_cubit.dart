import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_currency_converter_bloc/src/data/models/currency_details.dart';

part 'changed_currency_state.dart';

class ChangedCurrencyCubit extends Cubit<ChangedCurrencyInitial> {

  ChangedCurrencyCubit()
      : super(
          ChangedCurrencyInitial(
            currency: CurrencyDetails(
              name: "Австралия",
              code:  "AUD",
              isoCode2:  "AU",
              namePlural:  '',
              flagUrl:  'https://flagcdn.com/120x90/au.webp',
            )
          ),
        );
void setCurrency(CurrencyDetails currency){
  if (currency != null){
    emit(ChangedCurrencyInitial(currency: currency));
  }
  
  
}

}

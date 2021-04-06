part of 'fetch_convert_currency_cubit.dart';



class FetchConvertCurrencyInitial extends Equatable  {
  final List<ConvertModelDetails> convertModelDetails;
 // final AsyncCurrencyRepository asyncCurrencyRepository ;

   FetchConvertCurrencyInitial({
     this.convertModelDetails,
  }): assert(convertModelDetails != null);
  //


  @override
  // TODO: implement props
  List<Object> get props => [convertModelDetails];
}

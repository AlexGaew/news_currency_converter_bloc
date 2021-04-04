part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent {}
class CurrencyEventRequested extends CurrencyEvent
{
 static CurrencyDetails currency;

}
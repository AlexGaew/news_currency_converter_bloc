part of 'currency_bloc.dart';

@immutable

abstract class CurrencyState extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class CurrencyStateInitial extends CurrencyState {}

class CurrencyStateLoading extends CurrencyState {}

class CurrencyStateSuccess extends CurrencyState {
  final List<CurrencyDetails> listCurrency;

  CurrencyStateSuccess({@required this.listCurrency}) : assert(listCurrency != null);

  @override
  // TODO: implement props
  List<Object> get props => [listCurrency];
}

class CurrencyStateFailure extends CurrencyState {}
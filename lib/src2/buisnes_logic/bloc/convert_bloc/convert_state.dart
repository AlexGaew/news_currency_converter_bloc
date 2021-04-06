part of 'convert_bloc.dart';

@immutable
abstract class ConvertState extends Equatable {
  @override
// TODO: implement props
  List<Object> get props => [];
}

class ConvertStateLoading extends ConvertState {}

class ConvertStateSuccess extends ConvertState {
  final ConvertModelDetails convertModelCurrency;

  ConvertStateSuccess({this.convertModelCurrency})
      : assert(convertModelCurrency != null);

  @override
  // TODO: implement props
  List<Object> get props => [convertModelCurrency];
}

class CurrencyStateFailure extends ConvertState {}

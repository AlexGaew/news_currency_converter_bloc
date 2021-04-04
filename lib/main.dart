import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/bloc/convert_bloc/convert_bloc.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/bloc/currency_bloc/currency_bloc.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/activate_favorites_cubit.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/changed_currency_cubit.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/fetch_convert_currency_cubit.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/news/top_headlines_cubit.dart';
import 'src/buisnes_logic/cubit/changed_second_currency_cubit.dart';
import 'src/data/repositories/currency/async_currency_repository.dart';
import 'src/presentation/pages/root_page.dart';

void main() {
  final AsyncCurrencyRepository asyncCurrencyRepository =
      AsyncCurrencyRepository();
  runApp(MyApp(
    asyncCurrencyRepository: asyncCurrencyRepository,
  ));
}

class MyApp extends StatelessWidget {
  final AsyncCurrencyRepository asyncCurrencyRepository;

  MyApp({this.asyncCurrencyRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrencyBloc>(
          create: (context) =>
              CurrencyBloc(asyncCurrencyRepository: asyncCurrencyRepository)
                ..add(CurrencyEventRequested()),
        ),
        BlocProvider<ChangedCurrencyCubit>(
            create: (context) => ChangedCurrencyCubit()),
        BlocProvider<ChangedSecondCurrencyCubit>(
            create: (context) => ChangedSecondCurrencyCubit()),
        BlocProvider<ConvertBloc>(create: (context) => ConvertBloc()),
        BlocProvider<FetchConvertCurrencyCubit>(
            create: (context) => FetchConvertCurrencyCubit()),
        BlocProvider<TopHeadlinesCubit>(
            create: (context) => TopHeadlinesCubit()..getTopHeadNews()),
        BlocProvider<ActivateFavoritesCubit>(
            create: (context) => ActivateFavoritesCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFFd9dad7),
          backgroundColor: Color(0xff1a2639),
          focusColor: Color(0xFFFAFAFA),
        ),
        home: // Test(),
            RootPage(),
      ),
    );
  }
}

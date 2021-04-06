import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/bloc/convert_bloc/convert_bloc.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/bloc/currency_bloc/currency_bloc.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/bloc/news_bloc/news_bloc.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/changed_currency_cubit.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/changed_second_currency_cubit.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/fetch_convert_currency_cubit.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/news/top_headlines_cubit.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/povider/data.dart';
import 'package:news_currency_converter_bloc/src/data/models/convert_model_details.dart';
import 'package:news_currency_converter_bloc/src/data/models/currency_details.dart';
import 'package:news_currency_converter_bloc/src/presentation/screens/currency_list.dart';
import 'package:news_currency_converter_bloc/src/presentation/widgets/currency_card.dart';
import 'package:news_currency_converter_bloc/src/presentation/widgets/news_blogs.dart';
import 'package:provider/provider.dart';

class ChangeCurrencyPage extends StatelessWidget {
  final ConvertModelDetails convertModelDetails;
  TextEditingController textEditingController = TextEditingController();

  ChangeCurrencyPage({
    this.convertModelDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (_) => Data(),
      builder: (context, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: BlocBuilder<CurrencyBloc, CurrencyState>(
                      builder: (context, state) {
                    if (state is CurrencyStateLoading) {
                      return CircularProgressIndicator();
                    }
                    if (state is CurrencyStateSuccess) {
                      return ChangeCurrencyCardWidget(
                        onTap: () async {
                          context.read<ChangedCurrencyCubit>().setCurrency(
                                await Navigator.push<CurrencyDetails>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CurrencyList();
                                    },
                                  ),
                                ),
                              );
                        },
                        title: Text(
                          "${context.select((ChangedCurrencyCubit changedCurrencyCubit) => changedCurrencyCubit.state.currency.code)}",
                        ),
                        image: Image.network(
                            'https://flagcdn.com/120x90/${context.select((ChangedCurrencyCubit changedCurrencyCubit) => changedCurrencyCubit.state.currency.isoCode2.toLowerCase())}.webp'),
                        onChangeTextField: (value) {
                          context.read<Data>().change(value);
                          context
                              .read<FetchConvertCurrencyCubit>()
                              .getConvertCurrency(
                                from: context
                                    .read<ChangedCurrencyCubit>()
                                    .state
                                    .currency
                                    .code,
                                to: context
                                    .read<ChangedSecondCurrencyCubit>()
                                    .state
                                    .currency
                                    .code,
                                amount: int.parse(value) ?? 1,
                              );
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: BlocBuilder<CurrencyBloc, CurrencyState>(
                    builder: (context, state) {
                      if (state is CurrencyStateLoading) {
                        return CircularProgressIndicator();
                      }
                      if (state is CurrencyStateSuccess) {
                        return ChangeCurrencyCardWidget(
                          onTap: () async {
                            context
                                .read<ChangedSecondCurrencyCubit>()
                                .setSecondCurrency(
                                  await Navigator.push<CurrencyDetails>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return CurrencyList();
                                      },
                                    ),
                                  ),
                                );
                          },
                          title: Text(
                            "${context.select((ChangedSecondCurrencyCubit changedCurrencyCubit) => changedCurrencyCubit.state.currency.code)}",
                            style: TextStyle(fontSize: 15),
                          ),
                          image: Image.network(
                              'https://flagcdn.com/120x90/${context.select((ChangedSecondCurrencyCubit changedCurrencyCubit) => changedCurrencyCubit.state.currency.isoCode2.toLowerCase())}.webp'),
                          hintTextField: context.watch<Data>().isNull()
                              ? context.watch<Data>().value
                              : '${context.select((FetchConvertCurrencyCubit f) => f.state.convertModelDetails.first.rateForAmount)}',
                        );
                      }

                      return CircularProgressIndicator();
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, ind) => Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Divider(
                        color: Colors.white,
                        height: 30,
                      ),
                    ),
                    itemCount:
                        context.watch<TopHeadlinesCubit>().state.article.length,
                    itemBuilder: (context, count) {
                      return Builder(builder: (context) {
                        return NewsBlogWidget(
                          article: context
                              .watch<TopHeadlinesCubit>()
                              .state
                              .article[count],
                        );
                      });
                    },
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

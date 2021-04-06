import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/bloc/currency_bloc/currency_bloc.dart';
import 'package:news_currency_converter_bloc/src/data/models/currency_details.dart';
import 'package:news_currency_converter_bloc/src/presentation/widgets/card_currency_list_widget.dart';
import 'package:news_currency_converter_bloc/src/presentation/widgets/field_search.dart';

class CurrencyList extends StatefulWidget {
  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  // Controller _controller = Controller();
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  bool _IsSearching = true;
  String _searchText = "";

   Iterable<CurrencyDetails> currency = [];

  _CurrencyListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
  }

  @override
  void dispose() {
    super.dispose();
    _searchQuery.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: key,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SearchField(textEditingController: _searchQuery),
            ),

            Expanded(
              child: BlocBuilder<CurrencyBloc, CurrencyState>(
                  builder: (context, CurrencyState state) {
                if (state is CurrencyStateSuccess) {
                  currency = state.listCurrency;
                  return ListView(
                      children: _buildSearchList(state.listCurrency)
                      // state.listCurrency
                      //     .map((currency) =>
                      //     CardCurrencyListWidget(currency: currency))
                      //     .toList()

                  );
                }
                return null;
              }),
            )
          ],
        ),
      ),
    );
  }

  List<CardCurrencyListWidget> _buildSearchList(List<CurrencyDetails> list) {
    if (_searchText.isEmpty) {
      return list.map((e) => CardCurrencyListWidget(currency: e, )).toList();
    } else {
      List<CurrencyDetails> _list = [];
      for (int i = 0; i < list.length; i++) {
        final keys = currency.elementAt(i);

        if (keys.code.toLowerCase().contains(_searchText.toLowerCase())) {
          _list.add(keys);
        }
      }

      return _list.map((e) => CardCurrencyListWidget(currency:  e)).toList();
    }
  }
}

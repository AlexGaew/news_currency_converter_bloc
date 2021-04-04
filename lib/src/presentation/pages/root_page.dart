import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'file:///D:/AndroidStudioProjects/news_currency_converter_bloc/lib/src/data/repositories/currency/async_currency_repository.dart';
import 'package:news_currency_converter_bloc/src/presentation/pages/change_currency.dart';
import 'package:news_currency_converter_bloc/src/presentation/pages/post_cast_pages.dart';
import 'favorites_page.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/bloc/currency_bloc/currency_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatefulWidget {

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final _tapBar = [
    BottomNavigationBarItem(
        icon: Icon(Icons.article_rounded), label: 'Change Currency'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.headset), label: 'PostCast'),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      tabBar: CupertinoTabBar(
        backgroundColor: Theme.of(context).primaryColor,
        // inactiveColor: ,
        activeColor: Theme.of(context).focusColor,
        items: _tapBar,
      ),
      tabBuilder: (context, index) => CupertinoTabView(builder: (context) {
        if (index == 1) {
          return FavoritesPage();
        } else if (index == 2) {
          return PostCastPages();
        }
        return
          ChangeCurrencyPage();
      }),
    );
  }
}

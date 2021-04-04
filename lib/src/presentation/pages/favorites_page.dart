import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/activate_favorites_cubit.dart';
import 'package:news_currency_converter_bloc/src/presentation/widgets/favorites_blog_card.dart';
import 'package:news_currency_converter_bloc/src/presentation/widgets/news_blogs.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Center(
              child: Text(
            'Избранное',
            style: TextStyle(color: Theme.of(context).primaryColor),
            textAlign: TextAlign.center,
          )),
        ),
        body: BlocBuilder<ActivateFavoritesCubit, ActivateFavoritesState>(
          builder: (context, state) {
            if (state is ActivateFavoritesState) {
              final favorites = state.favoritesMap?.values;
              return ListView.builder(
                itemCount: favorites?.length ?? 0,
                itemBuilder: (context, index) => FavoritesBlogCard(
                  article: favorites.elementAt(index),
                ),
              );
            }
            return Center(
              child: Text(
                'Ничего не добавлено',
                style: TextStyle(color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
            );
          },
        ));
  }
}

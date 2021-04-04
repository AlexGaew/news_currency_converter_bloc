import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/activate_favorites_cubit.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/article.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/source.dart';

class FavoriteButton extends StatelessWidget {
  final Article article;

  const FavoriteButton({
    Key key, this.article
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivateFavoritesCubit, ActivateFavoritesState>(
        builder: (ctx, state) {
          final _cubit = BlocProvider.of<ActivateFavoritesCubit>(context);
          if (state.isFavorites(article.url)) {
            return IconButton(
              splashColor: Colors.green,
              highlightColor: Colors.orange,
              onPressed: () {
                _cubit.removeFavorites(article.url);
              },
           
              icon: Icon(

                Icons.favorite,

                color: Colors.red,
                size: 30,
              ),
            );
          }

          return IconButton(
            onPressed: () {
              _cubit.addFavorites(article);
            },

            icon: Icon(
              Icons.favorite_border,
              color: Colors.red,
              size: 30,
            ),
          );

        }
    );
  }
}
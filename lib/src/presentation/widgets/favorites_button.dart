import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/activate_favorites_cubit.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/article.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/source.dart';

class FavoriteButton extends StatelessWidget {
  final Article article;
  //Source source = Source.fromArticle(article);

  const FavoriteButton({
    Key key, this.article
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Source source = Source.fromArticle(article);
    return BlocBuilder<ActivateFavoritesCubit, ActivateFavoritesState>(
        builder: (ctx, state) {
          final _cubit = BlocProvider.of<ActivateFavoritesCubit>(context);
          if (state.isFavorites(source.name)) {
            return IconButton(
              splashColor: Colors.green,
              highlightColor: Colors.orange,
              onPressed: () {
                _cubit.removeFavorites(source.name);
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
              _cubit.addFavorites(source);
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
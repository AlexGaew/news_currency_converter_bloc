import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/article.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/source.dart';

part 'activate_favorites_state.dart';

class ActivateFavoritesCubit extends Cubit<ActivateFavoritesState> {
  ActivateFavoritesCubit()
      : super(ActivateFavoritesState(BuiltMap<String, Article>()));

  void addFavorites(Article article) {
    emit(ActivateFavoritesState(state.favoritesMap.rebuild(
        (s) => s[article.url] = article)));
  }

  void removeFavorites(String url) {
    emit(
      ActivateFavoritesState(
        state.favoritesMap.rebuild((s) => {s.remove(url)}),
      ),
    );
  }
}

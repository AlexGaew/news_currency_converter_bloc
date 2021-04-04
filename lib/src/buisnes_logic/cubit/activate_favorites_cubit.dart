import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/article.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/source.dart';

part 'activate_favorites_state.dart';

class ActivateFavoritesCubit extends Cubit<ActivateFavoritesState> {
  ActivateFavoritesCubit()
      : super(ActivateFavoritesState(BuiltMap<String, Source>()));

  void addFavorites(Source source) {
    emit(ActivateFavoritesState(state.favoritesMap.rebuild(
        (s) => s[source.name] = source)));
  }

  void removeFavorites(String id) {
    emit(
      ActivateFavoritesState(
        state.favoritesMap.rebuild((s) => {s.remove(id)}),
      ),
    );
  }
}

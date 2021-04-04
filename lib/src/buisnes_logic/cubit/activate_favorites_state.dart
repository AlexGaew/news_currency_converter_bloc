part of 'activate_favorites_cubit.dart';

class ActivateFavoritesState {
  final BuiltMap<String, Source> favoritesMap;

  ActivateFavoritesState(this.favoritesMap);

  bool isFavorites(id) {
    return favoritesMap?.containsKey(id) == true;
  }

  // factory ActivateFavoritesState.fromMap(Map<String, dynamic> map) {
  //   return ActivateFavoritesState(
  //     BuiltMap<String, dynamic>.from(((map['favoritesMap']) as Map) ?? {})
  //         .map((key, value) => MapEntry(
  //               key,
  //               Article.fromJson(value),
  //             )),
  //   );
  // }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'favoritesMap': this.favoritesMap?.toMap(),
    };
  }
}

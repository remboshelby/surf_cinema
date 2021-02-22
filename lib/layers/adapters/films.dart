import 'package:surf_cinema/layers/models/ui/film.dart';
import 'package:surf_cinema/layers/services/api/impl/page.dart';
import 'package:surf_cinema/layers/services/api/schemes.dart';

class FilmsAdapter {
  FilmUiModel _createFilmMeta(FilmItemResponse item) {
    final releaseDate = DateTime.parse(item.releaseDate);
    return FilmUiModel(
        id: item.id,
        title: item.title,
        posterPath: item.posterPath,
        overview: item.overview,
        releaseDate: releaseDate);
  }

  List<FilmUiModel> createFilmsList(Page<FilmItemResponse> page) {
    final list = page.results;
    final filmList = <FilmUiModel>[];
    list.forEach((element) {
      filmList.add(
        _createFilmMeta(element),
      );
    });
    return filmList;
  }
}

import 'package:optional/optional_internal.dart';
import 'package:surf_cinema/layers/models/ui/film.dart';

abstract class FilmsService {
  Future<List<FilmUiModel>> discoverFilms({int page});

  Future<List<FilmUiModel>> searchFilms({
    Optional<String> keyWord,
    int page,
  });
}

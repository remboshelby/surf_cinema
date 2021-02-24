import 'package:optional/optional.dart';
import 'package:surf_cinema/layers/adapters/films.dart';
import 'package:surf_cinema/layers/models/ui/film.dart';
import 'package:surf_cinema/layers/services/api/gateway.dart';
import 'package:surf_cinema/layers/services/domain/films.dart';

class FilmsServiceImpl implements FilmsService {
  final ApiGateway _apiGateway;
  final FilmsAdapter filmsAdapter;

  FilmsServiceImpl(
    this._apiGateway,
    this.filmsAdapter,
  );

  @override
  Future<List<FilmUiModel>> discoverFilms({int page}) async {
    final filmsPage = await _apiGateway.discoverFilms(page: page);
    return filmsAdapter.createFilmsList(filmsPage);
  }

  @override
  Future<List<FilmUiModel>> searchFilms({
    Optional<String> keyWord = const Optional.empty(),
    int page,
  }) async {
    final filmsPage = await _apiGateway.searchFilms(
      page: page
    );
    return filmsAdapter.createFilmsList(filmsPage);
  }
}

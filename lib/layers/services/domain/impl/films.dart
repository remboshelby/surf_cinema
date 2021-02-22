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
  Future<List<FilmUiModel>> discoverFilms() async {
    final page = await _apiGateway.discoverFilms();
    return filmsAdapter.createFilmsList(page);
  }

  @override
  Future<List<FilmUiModel>> searchFilms(Optional<String> keyWord) async {
    final page = await _apiGateway.searchFilms(keyWord);
    return filmsAdapter.createFilmsList(page);
  }
}

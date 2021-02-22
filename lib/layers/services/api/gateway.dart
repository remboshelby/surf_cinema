import 'package:optional/optional.dart';
import 'package:surf_cinema/layers/services/api/impl/page.dart';
import 'package:surf_cinema/layers/services/api/schemes.dart';

abstract class ApiGateway {
  Future<Page<FilmItemResponse>> discoverFilms();

  Future<Page<FilmItemResponse>> searchFilms(Optional<String> keyWord);
}
import 'package:optional/optional.dart';
import 'package:surf_cinema/layers/api/dio_client.dart';
import 'package:surf_cinema/layers/services/api/gateway.dart';
import 'package:surf_cinema/layers/services/api/impl/page.dart';
import 'package:surf_cinema/layers/services/api/schemes.dart';

class ApiGatewayImpl implements ApiGateway {
  final DioClient _client;

  ApiGatewayImpl(this._client);

  @override
  Future<Page<FilmItemResponse>> discoverFilms() async {
    final response = await _client.get(
      '/discover',
    );
    return Page.fromJson(_client.getJsonBody(response), (it) => FilmItemResponse.fromJson(it));
  }

  @override
  Future<Page<FilmItemResponse>> searchFilms(Optional<String> keyWord) async {
    final response = await _client.get(
      '/search-movies',
    );
    return Page.fromJson(_client.getJsonBody(response), (it) => FilmItemResponse.fromJson(it));
  }
}

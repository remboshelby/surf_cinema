import 'package:optional/optional.dart';
import 'package:surf_cinema/app/config.dart';
import 'package:surf_cinema/layers/api/dio_client.dart';
import 'package:surf_cinema/layers/services/api/gateway.dart';
import 'package:surf_cinema/layers/services/api/impl/page.dart';
import 'package:surf_cinema/layers/services/api/schemes.dart';
import 'dart:io' show Platform;

class ApiGatewayImpl implements ApiGateway {
  final DioClient _client;
  final Config config;

  ApiGatewayImpl(this._client,this.config);

  @override
  Future<Page<FilmItemResponse>> discoverFilms({int page}) async {
    String languageCode = Platform.localeName;
    final response = await _client.get(
      '/discover/movie?api_key=${config.apiKey}?page=$page?language=$languageCode',
    );
    return Page.fromJson(_client.getJsonBody(response), (it) => FilmItemResponse.fromJson(it));
  }

  @override
  Future<Page<FilmItemResponse>> searchFilms(Optional<String> keyWord) async {
    String languageCode = Platform.localeName;
    final response = await _client.get(
      '/search/movies?api_key=${config.apiKey}?page=$page?language=$languageCode',
    );
    return Page.fromJson(_client.getJsonBody(response), (it) => FilmItemResponse.fromJson(it));
  }
}

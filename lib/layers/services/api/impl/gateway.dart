import 'package:surf_cinema/layers/api/dio_client.dart';
import 'package:surf_cinema/layers/services/api/gateway.dart';

class ApiGatewayImpl implements ApiGateway{
  final DioClient _client;

  ApiGatewayImpl(this._client);

  @override
  Future<void> discoverFilms() async {
    final response = await _client.get(
      '/discover',
    );
  }

  @override
  Future<void> searchFilms(String keyWord) async {
    final response = await _client.get(
      '/search-movies',
    );
  }
}
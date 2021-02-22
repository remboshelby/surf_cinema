import 'package:surf_cinema/app/config.dart';
import 'package:surf_cinema/layers/services/api/gateway.dart';
import 'package:surf_cinema/layers/services/domain/films.dart';

class FilmsServiceImpl implements FilmsService{
  final Config _config;
  final ApiGateway _apiGateway;

  FilmsServiceImpl(this._config, this._apiGateway);
}
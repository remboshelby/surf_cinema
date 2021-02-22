import 'package:get_it/get_it.dart';
import 'package:surf_cinema/app/config.dart';
import 'package:surf_cinema/layers/adapters/films.dart';
import 'package:surf_cinema/layers/services/api/gateway.dart';
import 'package:surf_cinema/layers/services/domain/films.dart';
import 'package:surf_cinema/layers/services/domain/impl/films.dart';

Future<void> setupDomainDependencies(Config config) async {
  final sl = GetIt.instance;

  sl.registerFactory<FilmsService>(
    () => FilmsServiceImpl(
      GetIt.instance.get<ApiGateway>(),
      GetIt.instance.get<FilmsAdapter>(),
    ),
  );
}

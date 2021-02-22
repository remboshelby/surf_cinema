import 'package:get_it/get_it.dart';
import 'package:surf_cinema/app/config.dart';
import 'package:surf_cinema/layers/api/dio_client.dart';
import 'package:surf_cinema/layers/services/api/gateway.dart';
import 'package:surf_cinema/layers/services/api/impl/gateway.dart';

Future<void> setupApiDependencies(Config config) async {
  final sl = GetIt.instance;

  sl.registerLazySingleton<ApiGateway>(
    () => ApiGatewayImpl(
      GetIt.instance.get<DioClient>(),
    ),
  );
}
